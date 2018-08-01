#  First steps with Ecto & Absinthe
[//]: (comment)
Small project for learning the basics of these two libraries. Many
features of both has deliberately been left out to keep the initial scope
narrow. For example, data validations are left out for now, as writing to the
database is planned to be covered in a later phase.

Focus has entirely been on creating a DB with
[Ecto](https://hex.pm/packages/ecto), mapping its tables and their relationships
into Elixir data structures. Then creating functions that can access the
data in order to finally wrapping it all with a simple API (based on
[GraphQL](https://graphql.org/)) via [Absinthe](http://absinthe-graphql.org/).
The DB models data around the most recent FIFA World Cup. Enhancement of each
part (including this document), as well as scope expansion of the project is an
aim over time as more experience is gained.

In many places through out the document, MFA (module/function/arity) notation is used in
order to stimulate a spatial intuition of the libraries, which personally helps
learning them and looking up details for them.

The repo is built on: [Erlang](http://erlang.org) 21,
[Elixir](https://elixir-lang.org/) 1.6 and
[PostgreSQL](https://www.postgresql.org/) 10.4.

## Setup
[Phoenix](https://phoenixframework.org/) bundles a few dependencies, of which
two is of special interest: `phoenix_ecto` and its default database
adapter `postgrex`, which handles interactions with the PostgreSQL [RDBMS](https://en.wikipedia.org/wiki/Relational_database_management_system). To bring in
Absinthe, two additional dependencies are needed: `absinthe_plug` and
`absinthe_ecto`.

## Database
I used a personal user without a password (courtesy of MacOS).
Here is how to create a dedicated PostgreSQL user _with_ a password:
```
psql> create user wc2018 with createdb password 'giveemaballeachffs';

```
Phoenix generates the database configuration up front. It can also be done with
the task: `ecto.gen.repo`. Ecto can interact with several repositories.
Configuration lives in the `Repo` module: `lib/wc2018/WorldCup18.Repo`.
```elixir
defmodule Wc2018Graphql.Repo do
  use Ecto.Repo, otp_app: :wc2018_graphql
end
```
The DB credentials lives in the app environment configuration
(`config/dev.exs`). The `password` key-value-pair can be omitted if not
required. `pool_size` makes sure that the given number of connections to the
database are kept open when the application is running.

```elixir
config :wc2018_graphql, Wc2018Graphql.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "daniel",
  database: "wc2018_graphql_dev",
  hostname: "localhost",
  pool_size: 10
```

### Modeling
Upon gathering data for the DB, focus were on the main statistics. I wanted to
model the data around the matches. That is, which teams played where. Who scored
the goals, in what way and when. Two additional tables where created for added
relationships, that is the city locations of the stadiums, as well as the
initial groups of the teams.

![db_model](/img/db_model.png)

### Migration
In order to model the DB as illustrated by the above
[ERD](https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model),
migrations needs to be written, which is how Ecto handles schemas modifications
over time. A migration can contain any number of changes. Splitting changes into
related chunks makes it practical to construct a DB and to see what's `up`.
Order matters, meaning that if something non-existing is referenced, Ecto will
raise. Below is the state of the migrations _after_ they have been executed .
To reach this state, migrations and corresponding schemas needs to be defined.

```
  Status    Migration ID    Migration Name
--------------------------------------------------
  up        20180705122012  add_groups_table
  up        20180705122017  add_teams_table
  up        20180705122024  add_players_table
  up        20180705122029  add_cities_table
  up        20180705122035  add_stadiums_table
  up        20180705232658  add_method_table
  up        20180706095402  add_matches_table
  up        20180706100255  add_goals_table

```
We will look at the first two migrations to see how they can be written as well
as the matches table which differs a tiny bit from the rest. Before doing that,
let's pay attention to the fields `Migration ID` and `Migration Name` in the
table output above.

In order to create a migration, one can either create them manually, or use the
task `ecto.gen.migration`. Using the latter approach has two distinct
advantages. First, as with any task, it saves us time as it generates the
minimum boilerplate. Second, we can learn how to do it manually by examining its
results. The task takes the name of the migration as its only required
argument (a second optional argument can be passed for a repo reference given by `-r`).

When executed for the first time, a new directory structure is created here:
`priv/repo/migrations/` with a file inside it, representing the migration. The
file path of the first migration is:
`priv/repo/migrations/20180705122012_add_groups_table.exs`. Both fields are
combined into the generated filename. The `Migration ID` which is prefixed is
crucial for the execution order, as it is a time stamp. Manually modifying it on
the file system, will indeed change the order of the execution.

Ecto provides another task to carry out the execution of the migrations;
`ecto.migrate`. Without arguments, it executes in order. There is a few ways of
pointing it to execute up to a specific migration, for a given repo etc.
Consult `mix help ecto.migrate` for complete list of options.

#### Migration of the groups table
Our first migration. Ecto generated the first expressions. Defining the
module name, and bringing the module `Ecto.Migrations` into the context.
It also provided an empty change do-block.

To create a table, we use `Ecto.Migrations.create/2`. The groups table shall
contain a single field which is of type string. Since group names are
single letters (`A..H`), a size limit is introduced (wondering whether
this can be expressed in a better way). Comments for both the table itself and
its field is written to keep the purpose clear.

```elixir
defmodule Wc2018Graphql.Repo.Migrations.AddGroupsTable do
  use Ecto.Migration

  def change do
    create table("groups",
      comment: "The groups of four, teams are challenged to advance from."
    ) do
      add :letter, :string, size: 1,
        comment: "Single letter group name."
    end
  end
end
```
Notice that this table (as well as all others) in the ERD, have an `id` field
and that we did not define it in our migration. That is because if a primary key
isn't explicitly defined for the table, Ecto creates it automatically and calls
it `id`. Last thing worth mentioning is the `Ecto.Migrations.timestamps/1`
helper function, which is often used (without arguments) but not in this project
yet. It can generate `inserted_at` and `updated_at` fields for the table. It is
omitted here, since it makes little sense having them when the table data are
only going to be queried and not altered.

#### Migration of the teams table
```elixir
defmodule Wc2018Graphql.Repo.Migrations.AddTeamsTable do
  use Ecto.Migration

  def change do
    create table("teams", comment: "Contending teams.") do
      add :name,      :string
      add :fifa_code, :string, size: 3, comment: "Three letter country code."

      add :group_id,  references "groups"
    end
  end
end
```
Not much new here, except that we now reference the table created in the first
migration by using `Ecto.Migrations.references/1`. This expression creates a
foreign key. Since we use the default primary key that Ecto created for us in
the migration of the `groups` table, no additional options are required here.
In the data base this is simply represented as `CONSTRAINT groups_pkey`.

#### Migration of the matches table

```elixir
defmodule Wc2018Graphql.Repo.Migrations.AddMatchesTable do
  use Ecto.Migration

  def change do
    create table("matches", comment: "Played matches.") do
      add :result,    :string, size: 5
      add :playtime,  :naive_datetime

      add :home_team_id, references :teams
      add :away_team_id, references :teams
      add :stadium_id,   references :stadiums
    end
  end
end
```
Both `home_team_id` and `away_team_id` refers to the same table.
Ecto will have trouble understanding this, unless the names follow the
convention used, that is to have an `_id` suffix in the names of the fields
that has the foreign keys.

## Schema
Before we can write our data module for seeding real data, we need structure.
`Ecto.Schema` maps the data source into an Elixir struct, just what we need.

### Schema for groups

```elixir
defmodule Wc2018Graphql.Group do
  use Ecto.Schema
  alias Wc2018Graphql.Team

  schema "groups" do
    field :letter, :string, size: 1

    has_many :teams, Team
  end
end
```
This looks similar to the corresponding migration. Our module is named after the
singular name of our table. We are loading `Ecto.Schema` into our context.
We then use the `schema` macro to represent the structure and then define the
types similarly to how it is done in the migrations.

Notice how we define the relationship to the teams table with the `has_many`
macro. We refer to the schema name with an atom, and then pass the module name
with our alias for where that schema definition can be found. This is ground
work for validation introduction later. YAGNI now, but since this is a
project for educational purposes, it makes sense to emphasize the relationships.

### Schema for teams

```elixir
defmodule Wc2018Graphql.Team do
  use Ecto.Schema
  alias Wc2018Graphql.{Group, Player, Match}

  schema "teams" do
    field      :name,       :string
    field      :fifa_code,  :string, size: 3

    belongs_to :group,      Group
    has_many   :players,    Player
    has_many   :matches,    Match
  end
end
```

The team schema follows the same format. Notice how the DB foreign key or
`Ecto.Migration.references` translates to a `belongs_to` macro in `Ecto.Schema`.
The `has_many` and `has_one` macros are the "opposite side" of a `belongs_to`,
or a foreign key.

As with the migrations, we kept looking at the groups and teams schemas up
close. The rest have the same relational logic and needs no further examination.

### Migration handling
Since we have the schemas defined, it is time to run the migrations.
At this point, all of the migrations are down, meaning that none of the tables
are yet created in the DB.

```
$ mix ecto.migrations

Repo: Wc2018Graphql.Repo

  Status    Migration ID    Migration Name
--------------------------------------------------
  down      20180705122012  add_groups_table
  down      20180705122017  add_teams_table
  down      20180705122024  add_players_table
  down      20180705122029  add_cities_table
  down      20180705122035  add_stadiums_table
  down      20180705232658  add_method_table
  down      20180706095402  add_matches_table
  down      20180706100255  add_goals_table
```

It's not possible to execute a migration if any of its dependent migrations are
`down`. We can construct the DB up to a specific migration. Here's how we can
create the groups and teams tables:

```
$ mix ecto.migrate -v 20180705122017
[info] == Running Wc2018Graphql.Repo.Migrations.AddGroupsTable.change/0 forward
[info] create table groups
[info] == Migrated in 0.0s
[info] == Running Wc2018Graphql.Repo.Migrations.AddTeamsTable.change/0 forward
[info] create table teams
[info] == Migrated in 0.0s

  Status    Migration ID    Migration Name
--------------------------------------------------
  up        20180705122012  add_groups_table
  up        20180705122017  add_teams_table
  down      20180705122024  add_players_table
  down      20180705122029  add_cities_table
  ...
```
It runs the migrations up to and including the given `Migration ID`.

Executing `mix ecto.migrate` will bring `up` the rest.

### Peeking into the database
At this point, its a good idea to make sure that everything is laid out
as we indented in the DB. We'll use the
[psql](https://www.postgresql.org/docs/current/static/app-psql.html) client that
ships with Postgres. Since I called the project `wc2018_graphql`, the
development database for it mirrors its name with the environment name
padded on. Also, as mentioned before, since I am using my own user in the
database without a password, both are omitted. Otherwise it could have been
passed in with the username with `-U` and commanded `psql` to prompt me for a
password with `-W`.

```sql
$ psql wc2018_graphql_dev
```
Let's start by looking at the schema and the tables we created.
```sql
wc2018_graphql_dev-# \dn
 List of schemas
  Name  | Owner
--------+--------
 public | daniel
(1 row)
```

```sql
wc2018_graphql_dev-# \dt
              List of relations
 Schema |       Name        | Type  | Owner
--------+-------------------+-------+--------
 public | cities            | table | daniel
 public | goals             | table | daniel
 public | groups            | table | daniel
 public | matches           | table | daniel
 public | methods           | table | daniel
 public | players           | table | daniel
 public | schema_migrations | table | daniel
 public | stadiums          | table | daniel
 public | teams             | table | daniel
(9 rows)
```
Looks as expected, except the table `schema_migrations`.

```sql
wc2018_graphql_dev=# select * from public.schema_migrations;
    version     |        inserted_at
----------------+----------------------------
 20180705122012 | 2018-07-25 13:58:38.582465
 20180705122017 | 2018-07-25 13:58:38.606167
 20180705122024 | 2018-07-25 13:58:38.621327
 20180705122029 | 2018-07-25 13:58:38.640396
 20180705122035 | 2018-07-25 13:58:38.658559
 20180705232658 | 2018-07-25 13:58:38.675035
 20180706095402 | 2018-07-25 13:58:38.692609
 20180706100255 | 2018-07-25 13:58:38.710469
(8 rows)
```
The version field _is_ Ecto's `Migration ID`. This is good place to see _when_
a schema modification took place.

---
```sql
wc2018_graphql_dev=# \d groups
                                   Table "public.groups"
 Column |         Type         | Collation | Nullable |              Default
--------+----------------------+-----------+----------+------------------------------------
 id     | bigint               |           | not null | nextval('groups_id_seq'::regclass)
 letter | character varying(1) |           |          |
Indexes:
    "groups_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE "teams" CONSTRAINT "teams_group_id_fkey" FOREIGN KEY (group_id) REFERENCES groups(id)

```
---

```sql
wc2018_graphql_dev=# \d teams
                                     Table "public.teams"
  Column   |          Type          | Collation | Nullable |              Default
-----------+------------------------+-----------+----------+-----------------------------------
 id        | bigint                 |           | not null | nextval('teams_id_seq'::regclass)
 name      | character varying(255) |           |          |
 fifa_code | character varying(3)   |           |          |
 group_id  | bigint                 |           |          |
Indexes:
    "teams_pkey" PRIMARY KEY, btree (id)
Foreign-key constraints:
    "teams_group_id_fkey" FOREIGN KEY (group_id) REFERENCES groups(id)
Referenced by:
    TABLE "matches" CONSTRAINT "matches_away_team_id_fkey" FOREIGN KEY (away_team_id) REFERENCES teams(id)
    TABLE "matches" CONSTRAINT "matches_home_team_id_fkey" FOREIGN KEY (home_team_id) REFERENCES teams(id)
    TABLE "players" CONSTRAINT "players_teams_id_fkey" FOREIGN KEY (teams_id) REFERENCES teams(id)
```
---
Everything laid out as we wanted. In the last section of the teams table, we can
confirm that the matches tables indeed holds two foreign keys to this table.




### Seed
Now that we have our DB and data structures prepared, we can write a module for
seeding some real data. I have collected the data from
[this](http://worldfootball.net) excellent website.

Phoenix prepares an empty script file for this purpose here: `priv/repo/seeds.exs`.
After statically writing the data to in the `Data` module the file became large.
The module contains the public `Wc2018Graphql.Data.generate/0` function which is
called when we execute it. Most of the code is self explanatory so I am rapidly
covering an overview of each part.

#### Schema structs
First, this is how the structs for our modules `Group` and `Team` looks like:

```elixir
iex(1) %Wc2018Graphql.Group{}
%Wc2018Graphql.Group{
  __meta__: #Ecto.Schema.Metadata<:built, "groups">,
  id: nil,
  letter: nil,
  teams: #Ecto.Association.NotLoaded<association :teams is not loaded>
}
```

```elixir
iex(2) %Wc2018Graphql.Team{}
%Wc2018Graphql.Team{
  __meta__: #Ecto.Schema.Metadata<:built, "teams">,
  fifa_code: nil,
  group: #Ecto.Association.NotLoaded<association :group is not loaded>,
  group_id: nil,
  id: nil,
  match: #Ecto.Association.NotLoaded<association :match is not loaded>,
  name: nil,
  player: #Ecto.Association.NotLoaded<association :player is not loaded>
}

```
The `#Ecto.Association.NotLoaded` part has to do with pre-loading. Basically, Ecto avoids to
implicitly load data from distant tables for good reasons.
Details on this will be covered together with changesets in the future.
Unfortunately, the [official
documentation](https://hexdocs.pm/ecto/Ecto.Association.NotLoaded.html#content)
for this association is pretty thin for now.

#### Seed groups
All the schema modules that's been created are aliased at the top of the Data
seed module to save us some typing. Then the Group type is used to load the
eight groups into the database with `Repo.insert!/1`. We bind the value that
`insert` returns so that we can refer to it composing other structures.

Here is how we store the existence of group D into the DB:
```elixir
group_d = Repo.insert! %Group{ letter: "D" }
```

Inspecting the result (some parts omitted for brevity) that is bound to the variable
in [IEx](https://hexdocs.pm/iex/IEx.html), we can see that the `INSERT` was
successful and the raw query that was carried out.
```elixir
iex(1)> i Repo.insert %Group{letter: "D"}
[debug] QUERY OK db=0.2ms
begin []
[debug] QUERY OK db=1.3ms
INSERT INTO "groups" ("letter") VALUES ($1) RETURNING "id" ["D"]
[debug] QUERY OK db=2.5ms
commit []
Term
  {:ok, %Wc2018Graphql.Group{__meta__: #Ecto.Schema.Metadata<:loaded, "groups">, id: 11, letter: "D", teams: #Ecto.Association.NotLoaded<association :teams is not loaded>}}
  ...
```

#### Seed teams
See how we relate the team to the group created.

```elixir
team_argentina = Repo.insert! %Team{
  name:      "Argentina",
  fifa_code: "ARG",
  group:     group_d
}
```

#### Seed players
For seeding the players into the right teams we use this simple function.
It expects a list of players and a reference to team to relate them to.

```elixir
defp load_players(players, team) do
  Enum.each( players, fn p ->
    Repo.insert! %Player { name: p, teams: team }
  end)
end
```
After which, the players are inserted like so:

```elixir
load_players(
    [
      "Angel Di maria",
      "Cristian Ansaldi",
      "Cristian Pavon",
      ...
    ], team_argentina
  )
```

The cities and stadiums do not need further explanation.

#### Seed matches

The matches table have relationships to the teams and stadiums table. While
seeding, we keep them close to the goals scored in the match.

```elixir
match_argentina_iceland = Repo.insert! %Match{
  playtime: ~N[2018-06-16 14:00:00],
  result: "1-1",
  stadium: stadium_otkrytie,
  home_team: team_argentina,
  away_team: team_iceland
}
Repo.insert %Goal{
  match_id: match_argentina_iceland.id,
  match_minute: 19,
  method: method_left_foot,
  player: Repo.get_by(Player, name: "Kun Agueero")
}
```
To run the script and seed the database we can do:
```
$ mix do ecto.drop, ecto.create, ecto.migrate && mix run priv/repo/seeds.exs
```
We are wiping away everything and loading all the data.

## Data access
Now that we have the database loaded with some stats, we can query it.
In the IEx session, let's alias the modules we will be using and bring in
`Ecto.Query`:

```elixir
iex(1)> alias Wc2018Graphql.{Team, Player, Goal, Match}
[Wc2018Graphql.Team, Wc2018Graphql.Player, Wc2018Graphql.Goal,
 Wc2018Graphql.Match]

iex(2)> import Ecto.Query
Ecto.Query
```

Let's query for all the teams participated in the tournament:
```elixir
iex(3)> Repo.all from t in Team, select: t.name

[debug] QUERY OK source="teams" db=3.5ms
SELECT t0."name" FROM "teams" AS t0 []
["Argentina", "Australia", "Belgium", "Brazil", "Colombia", "Costa Rica",
 "Croatia", "Denmark", "Egypt", "England", "France", "Germany", "Iran",
 "Iceland", ...]
```

By FIFA code?
```elixir
iex(4)> Repo.all from t in Team, select: t.fifa_code
["ARG", "AUS", "BEL", "BRA", "COL", "CRC", "CRO", "DEN", "EGY", "ENG", "FRA",
 "GER", "IRN", "ISL", ...]
```

Perfect, simple queries are easy with Ecto! Let's say we want the result of the
last query back as a list of tuples:

```elixir
iex(5)> Repo.all from t in Team, select: {t.fifa_code}
[
  {"ARG"},
  {"AUS"},
  {"BEL"},
  {"BRA"},
  {"COL"},
   ...
]
```
How about a list of name and FIFA code combinations in a map?

```elixir
iex(6)> Repo.all from t in Team, select: %{team_name: t.name, country_code: t.fifa_code}
[
  %{country_code: "ARG", team_name: "Argentina"},
  %{country_code: "AUS", team_name: "Australia"},
  %{country_code: "BEL", team_name: "Belgium"},
  %{country_code: "BRA", team_name: "Brazil"},
  ...
]
```
What are the names of the players that played for the Swedish national team?

This one gets a tiny bit longer as we need to express a relationship. Let's
first start by looking at the query and its results.

```elixir
iex(7)> Repo.all from p in Player,
          join: t in assoc(p, :teams),
          where: p.teams_id == t.id and t.name == "Sweden",
          select: p.name

[debug] QUERY OK source="players" db=4.8ms
SELECT p0."name" FROM "players" AS p0 INNER JOIN "teams" AS t1 ON t1."id" = p0."teams_id" WHERE ((p0."teams_id" =
 t1."id") AND (t1."name" = 'Sweden')) []
["Andreas Granqvist", "Kristoffer Nordfeldt", "Sebastian Larsson", ...]
```
By the mere looks of it, comparing to the debug output where the executed query in
raw SQL is printed, the logic looks identical, with Ecto being a bit more elegant...

We start by using the `Ecto.Repo.all` callback just as before. We refer to the players table, again
just as before, by using our aliased module (`Wc2018Graphql.Player`) and binding it to the `p` variable.
Nothing new yet.

Now, from Ecto's perspective, this is a naked player:
```elixir
%Wc2018Graphql.Player{
  __meta__: #Ecto.Schema.Metadata<:built, "players">,
  id: nil,
  name: nil,
  teams: #Ecto.Association.NotLoaded<association :teams is not loaded>,
  teams_id: nil
}
```
From our perspective, perhaps something like this:
![player_teams_erd](/img/players_teams_erd.png)

A player belongs to a team, and that team is to be found in the teams table.
We have a reference to it in the form of a foreign key called `team_id`, which
refers to the primary key in the teams table, which uses the default field name of `id`.

To describe this relationship, we use the `Ecto.Query.join` expression, in which
we use the `Ecto.assoc` function for describing the association. It takes a
table name as an atom.

We simply ask for a reference to whichever field in the players table that leads
to the teams table. Then we bind that reference to the `t` variable. At this
stage, we have both tables at our finger tips, and we can do anything with their
fields in relationship to each other. By the way, the debug output reveals
that `Ecto.Query.join` is doing an `INNER JOIN` by default.

Then we use the `Ecto.Query.where` macro to describe that we are only interested
in players that have a `teams_id` that matches rows in the teams table where the
`name` field is equal to "Sweden".

Finally, we use the `Ecto.Query.select` macro to return the name of those
players that matched.

## Data access functions
If we want to make the last query generic, we can wrap it in a function that
accepts an argument which should match a teams name. Here is how it can be
written:

```elixir
def players_of(team_name) do
  team = String.capitalize(team)

  Repo.all from p in Player,
    join: t in assoc(p, :teams),
    where: p.teams_id == t.id and t.name == ^team,
    select: p.name
end
```
First, we capitalize the incoming team name to match the format in the teams
table. Then in the where expression, we use that variable. Note how the pin
operator is used. It is used because `Ecto.Query.where` is a macro and if we
were not using it, the word team would be translated litteraly, and not
interpolated.

Here is a somewhat ugly way of getting the top scorers. What I do not like about
this is the double execution of the count aggregate function.

```elixir
@limit 10
def top_scorers(n \\@limit) do
  Repo.all from g in Goal,
   join:     p in assoc(g, :player),
   group_by: p.id,
   select:   {count(g.player_id), p.name},
   order_by: [desc: count(g.player_id)],
   limit:    ^n
end
```
Nonetheless, we return a tuple of the number of goals together with the name of
the player:
```elixir
[
  {7, "Harry Kane"},
  {6, "Denis Cheryshev"},
  {5, "Antoine Griezmann"},
  {4, "Mario Mandzukic"},
  ...
]
```
Matches that ended by penalties? End penalties were all seeded with
a `match_minute` value of 120 as a normal game is 2(45) minutes and an extension +2(15).

```elixir
def matches_with_penalties do
  Repo.all from g in Goal,
    where:    g.match_minute == 120,
    join:     m in assoc(g,  :match),
    join:     ht in assoc(m, :home_team),
    join:     at in assoc(m, :away_team),
    select:   {ht.name, at.name},
    distinct: ht.name
end

[
  {"Colombia", "England"},
  {"Croatia", "Denmark"},
  {"Russia", "Croatia"},
  {"Spain", "Russia"}
]
```
That's the gist of it. It's possible to divide and compose this, but I leave
that exercise for another time so we can move on.

## Creating an API
The times has come to create the client interface for interacting with the data.

### The GraphQL schema
When the server needs to decide how to respond to a request, the schema is the
source to lookup that information. It is both the source of the domain
model and the source of how to retrieve data. Since it defines behaviour, it
can be viewed as the API implementation itself.

Let us start to write one in `lib/wc2018_graphql_web/schema.ex`. As we are used
to by now, we look at the code, and talk about it afterwards.

```elixir
defmodule Wc2018GraphqlWeb.Schema do
  use Absinthe.Schema
  alias Wc2018GraphqlWeb.Resolvers

  @desc "World Cup 2018"
  query do
    @desc "Contending teams"
    field :teams, list_of(:team) do
      arg :name, :string
      resolve &Resolvers.Team.team/3
    end
  end

  @desc "Team representation"
  object :team do
    field :fifa_code, :string, description: "Three-letter country code"
    field :name,      :string, description: "Country name"
    field :group,     :string, description: "Part of this group at start"
  end
```

`Absinthe.Schema` is used for defining GraphQL schemas. The alias is to a new
module which we will look at shortly. The `@desc` attribute is a recommended way
to document the API for consumers as well as for our future selves.

#### Root query object
Absinthe comes with a handy function called `Absinthe.Schema.lookup_type`
to lookup a type by a name or identifier. Let's see the representation of the
root query object. Many fields are omitted for brevity and those that I have
found useful are shown below:

```elixir
iex(1)> Absinthe.Schema.lookup_type(Wc2018GraphqlWeb.Schema, "RootQueryType")
%Absinthe.Type.Object{
    identifier: :query,
    name: "teams",
    description: "Contending teams",
    middleware: [
      {{Absinthe.Resolution, :call}, &Wc2018GraphqlWeb.Resolvers.Team.team/3}
    ],
    name: "teams",
    triggers: [],
    type: %Absinthe.Type.List{of_type: :team},
    fields: %{
      teams: %Absinthe.Type.Field{
        __reference__: %{
          location: %{
            file: ".../lib/wc2018_graphql_web/schema.ex",
            line: 12
          },
        },
        args: %{
          name: %Absinthe.Type.Argument{
            __reference__: %{
              location: %{
                file: ".../lib/wc2018_graphql_web/schema.ex",
                line: 13
            },
            ...
}
```
The official documentation is a good place to lookup details for all the types.
Now that we know how to look them up, let's move on and see how we have defined
our root query object, which is defined with the
`Absinthe.Schema.query` macro.

We have defined a new field with `Absinthe.Schema.Notation.field`, as a list of
`:team` objects with the `Absinthe.Schema.Notation.list_of` macro. We then
define that this field takes a single argument of a string type that we call
name and finally referring to our resolve function with the
`Absinthe.Schema.Notation.resolve`.

The team object follows the same pattern. We describe the type that can be
queried, that is, it represents the output of our resolver.

### Resolvers
A resolvers job is to make sure that input that the client sends is handled by
the right function to deliver the data.

The team resolver will look familiar, as its the same query we explored in the
data access section, slightly rewritten. It lives in
`lib/wc2018_graphql_web/resolvers/team.ex`.

```elixir
defmodule Wc2018GraphqlWeb.Resolvers.Team do
  import Ecto.Query
  alias Wc2018Graphql.{Repo,Team}

    def team(_, %{name: name}, _) when is_binary(name) do
    teams = Repo.all from t in Team,
      join: g in assoc(t, :group),
      where: ilike(t.name, ^"%#{name}%"),
      select: %Team{fifa_code: t.fifa_code, name: t.name, group: g.letter}

    {:ok, teams}
  end

    def team(_,_,_) do
    teams = Repo.all from t in Team,
      join: g in assoc(t, :group),
      select: %Team{fifa_code: t.fifa_code, name: t.name, group: g.letter}

    {:ok, teams}
  end
end
```
Absinthe pass on arguments to the resolvers only if its been provided by the
client. Matching on a map of arguments in the resolver function clause is handy
for checking arguments in the request.

Our resolver can handle requests with an without an argument. In the latter
case, all teams will be returned. Now is a good time to pause and test this out.


### Configuring the router
We are going to configure routes to the bundled
[GraphiQL](https://github.com/graphql/graphiql) IDE that we will check out in
the future. Also we need regular routes for accepting requests from other
clients. Phoenix keeps the router here: `lib/wc2018_graphql_web/router.ex`.

```elixir
defmodule Wc2018GraphqlWeb.Router do
  use Wc2018GraphqlWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

  forward "/api", Absinthe.Plug,
    schema: Wc2018GraphqlWeb.Schema

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: Wc2018GraphqlWeb.Schema,
    interface: :advanced
    #interface: :simple
    #interface: :playground # vim-mode ftw!
  end
end
```
Nothing out of the ordinary here. Note that GraphiQL comes with three
interfaces.

## Testing
The test is written to `test/wc2018_graphql_web/schema/query/teams_test.exs` and
running them shows what we are testing, and that the error view tests are
provided for us, which is very nice.

```
Wc2018GraphqlWeb.ErrorViewTest
  * test renders 404.json (13.3ms)
  * test renders 500.json (0.4ms)

Wc2018GraphqlWeb.Schema.Query.TeamsTest
  * test query teams returns correct field data for specific team (1246.2ms)
  * test query teams return correct field data (1162.2ms)
  * test query teams return error for invalid input (1162.2ms)

Finished in 3.6 seconds
5 tests, 0 failures
```
Let's start the server and fire a few request from the shell to demonstrate it,
before we move on the bundled client which provides a web UI with some good
introspective capabilities.

## Demo  of the service
The service is listening on Phoenix's default port.
```
$ iex phx.server
[info] Running Wc2018GraphqlWeb.Endpoint with Cowboy using http://0.0.0.0:4000
```

Let's query the group of the
Swedish team from the shell ([jq](https://github.com/stedolan/jq) for JSON formatting).

```
$ curl -s -H 'content-type: application/json' \
       -X POST \
       -d '{teams(name:"swe") {group}}' \
       http://localhost:4000/api | jq '.'

{
  "data": {
    "teams": [
      {
        "group": "F"
      }
    ]
  }
}

```
The fact that we could pass the string "swe" instead of "Sweden" as its stored
in the DB, is because of the implementation, where we used `ilike` for the match.

Alright, FIFA code and name for Argentina?

```
...
       -d '{teams(name:"argentina") {fifa_code, name}}' 
...

{
  "data": {
    "teams": [
      {
        "name": "Argentina",
        "fifa_code": "ARG"
      }
    ]
  }
}

```
We are getting exactly what we are asking for and nothing else. Also note that
we using the HTTP POST method for all queries as we provide a document that
describes what we are interested in.

Finally we are using a single endpoint for everything, no more remembering which
endpoint to use for getting what, doing several queries, filter what we need and
construct the data structure and so on and so forth.

That's it for now. With this, we have a working service that we can build upon
to explore further.
