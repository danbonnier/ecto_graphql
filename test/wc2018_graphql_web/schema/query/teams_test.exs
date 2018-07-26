defmodule Wc2018GraphqlWeb.Schema.Query.TeamsTest do
  use Wc2018GraphqlWeb.ConnCase, async: true
  setup do
    Code.load_file("priv/repo/seeds.exs")
  end

  @query "{ teams { fifa_code group name } }"
  
    test "query all fields for teams returns correct data" do
      conn = build_conn()
      conn = get conn, "/api", query: @query

      assert json_response(conn, 200) ==
        %{
          "data" => %{
            "teams" => [
              %{"fifa_code" => "URU", "group" => "A", "name" => "Uruguay"},
              %{"fifa_code" => "KSA", "group" => "A", "name" => "Saudi Arabia"},
              %{"fifa_code" => "RUS", "group" => "A", "name" => "Russia"},
              %{"fifa_code" => "EGY", "group" => "A", "name" => "Egypt"},
              %{"fifa_code" => "ESP", "group" => "B", "name" => "Spain"},
              %{"fifa_code" => "POR", "group" => "B", "name" => "Portugal"},
              %{"fifa_code" => "MAR", "group" => "B", "name" => "Morocco"},
              %{"fifa_code" => "IRN", "group" => "B", "name" => "Iran"},
              %{"fifa_code" => "PER", "group" => "C", "name" => "Peru"},
              %{"fifa_code" => "FRA", "group" => "C", "name" => "France"},
              %{"fifa_code" => "DEN", "group" => "C", "name" => "Denmark"},
              %{"fifa_code" => "AUS", "group" => "C", "name" => "Australia"},
              %{"fifa_code" => "NGA", "group" => "D", "name" => "Nigeria"},
              %{"fifa_code" => "ISL", "group" => "D", "name" => "Iceland"},
              %{"fifa_code" => "CRO", "group" => "D", "name" => "Croatia"},
              %{"fifa_code" => "ARG", "group" => "D", "name" => "Argentina"},
              %{"fifa_code" => "SUI", "group" => "E", "name" => "Switzerland"},
              %{"fifa_code" => "SRB", "group" => "E", "name" => "Serbia"},
              %{"fifa_code" => "CRC", "group" => "E", "name" => "Costa Rica"},
              %{"fifa_code" => "BRA", "group" => "E", "name" => "Brazil"},
              %{"fifa_code" => "SWE", "group" => "F", "name" => "Sweden"},
              %{"fifa_code" => "MEX", "group" => "F", "name" => "Mexico"},
              %{"fifa_code" => "KOR", "group" => "F", "name" => "Korea"},
              %{"fifa_code" => "GER", "group" => "F", "name" => "Germany"},
              %{"fifa_code" => "TUN", "group" => "G", "name" => "Tunisia"},
              %{"fifa_code" => "PAN", "group" => "G", "name" => "Panama"},
              %{"fifa_code" => "ENG", "group" => "G", "name" => "England"},
              %{"fifa_code" => "BEL", "group" => "G", "name" => "Belgium"},
              %{"fifa_code" => "SEN", "group" => "H", "name" => "Senegal"},
              %{"fifa_code" => "POL", "group" => "H", "name" => "Poland"},
              %{"fifa_code" => "JPN", "group" => "H", "name" => "Japan"},
              %{"fifa_code" => "COL", "group" => "H", "name" => "Colombia"} ]
          }
        }
    end
end
