defmodule Wc2018Graphql.Data do
  alias Wc2018Graphql.{
    Repo,   Group, Team,
    Player, City,  Stadium,
    Method, Match, Goal
  }

  defp load_players(players, team) do
    Enum.each( players, fn p ->
      Repo.insert! %Player { name: p, team: team }
    end)
  end

  def generate do
    Logger.disable( self() )

    group_a = Repo.insert! %Group{ letter: "A" }
    group_b = Repo.insert! %Group{ letter: "B" }
    group_c = Repo.insert! %Group{ letter: "C" }
    group_d = Repo.insert! %Group{ letter: "D" }
    group_e = Repo.insert! %Group{ letter: "E" }
    group_f = Repo.insert! %Group{ letter: "F" }
    group_g = Repo.insert! %Group{ letter: "G" }
    group_h = Repo.insert! %Group{ letter: "H" }

    team_argentina = Repo.insert! %Team{
      name:      "Argentina",
      fifa_code: "ARG",
      group:     group_d
    }
    team_australia = Repo.insert! %Team{
      name:      "Australia",
      fifa_code: "AUS",
      group:     group_c
    }
    team_belgium = Repo.insert! %Team{
      name:      "Belgium",
      fifa_code: "BEL",
      group:     group_g
    }
    team_brazil = Repo.insert! %Team{
      name:      "Brazil",
      fifa_code: "BRA",
      group:     group_e
    }
    team_colombia = Repo.insert! %Team{
      name:      "Colombia",
      fifa_code: "COL",
      group:     group_h
    }
    team_costarica = Repo.insert! %Team{
      name:      "Costa Rica",
      fifa_code: "CRC",
      group:     group_e
    }
    team_croatia = Repo.insert! %Team{
      name:      "Croatia",
      fifa_code: "CRO",
      group:     group_d
    }
    team_denmark =  Repo.insert! %Team{
      name:      "Denmark",
      fifa_code: "DEN",
      group:     group_c
    }
    team_egypt = Repo.insert! %Team{
      name:      "Egypt",
      fifa_code: "EGY",
      group:     group_a
    }
    team_england = Repo.insert! %Team{
      name:      "England",
      fifa_code: "ENG",
      group:     group_g
    }
    team_france = Repo.insert! %Team{
      name:      "France",
      fifa_code: "FRA",
      group:     group_c
    }
    team_germany = Repo.insert! %Team{
      name:      "Germany",
      fifa_code: "GER",
      group:     group_f
    }
    team_iran = Repo.insert! %Team{
      name:      "Iran",
      fifa_code: "IRN",
      group:     group_b
    }
    team_iceland = Repo.insert! %Team{
      name:      "Iceland",
      fifa_code: "ISL",
      group:     group_d
    }
    team_japan = Repo.insert! %Team{
      name:      "Japan",
      fifa_code: "JPN",
      group:     group_h
    }
    team_korea = Repo.insert! %Team{
      name:      "Korea",
      fifa_code: "KOR",
      group:     group_f
    }
    team_mexico = Repo.insert! %Team{
      name:      "Mexico",
      fifa_code: "MEX",
      group:     group_f
    }
    team_morocco = Repo.insert! %Team{
      name:      "Morocco",
      fifa_code: "MAR",
      group:     group_b
    }
    team_nigeria = Repo.insert! %Team{
      name:      "Nigeria",
      fifa_code: "NGA",
      group:     group_d
    }
    team_panama = Repo.insert! %Team{
      name:      "Panama",
      fifa_code: "PAN",
      group:     group_g
    }
    team_peru = Repo.insert! %Team{
      name:      "Peru",
      fifa_code: "PER",
      group:     group_c
    }
    team_poland = Repo.insert! %Team{
      name:      "Poland",
      fifa_code: "POL",
      group:     group_h
    }
    team_portugal = Repo.insert! %Team{
      name:      "Portugal",
      fifa_code: "POR",
      group:     group_b
    }
    team_russia = Repo.insert! %Team{
      name:      "Russia",
      fifa_code: "RUS",
      group:     group_a
    }
    team_saudi = Repo.insert! %Team{
      name:      "Saudi Arabia",
      fifa_code: "KSA",
      group:     group_a
    }
    team_senegal = Repo.insert! %Team{
      name:      "Senegal",
      fifa_code: "SEN",
      group:     group_h
    }
    team_serbia = Repo.insert! %Team{
      name:      "Serbia",
      fifa_code: "SRB",
      group:     group_e
    }
    team_spain = Repo.insert! %Team{
      name:      "Spain",
      fifa_code: "ESP",
      group:     group_b
    }
    team_sweden = Repo.insert! %Team{
      name:      "Sweden",
      fifa_code: "SWE",
      group:     group_f
    }
    team_switzerland = Repo.insert! %Team{
      name:      "Switzerland",
      fifa_code: "SUI",
      group:     group_e
    }
    team_tunisia = Repo.insert! %Team{
      name:      "Tunisia",
      fifa_code: "TUN",
      group:     group_g
    }
    team_uruguay = Repo.insert! %Team{
      name:      "Uruguay",
      fifa_code: "URU",
      group: group_a
    }

    load_players(
      [
        "Angel Di maria",
        "Cristian Ansaldi",
        "Cristian Pavon",
        "Eduardo Salvio",
        "Enzo Perez",
        "Ever Banega",
        "Federico Fazio",
        "Franco Armani",
        "Gabriel Mercado",
        "Giovani Lo celso",
        "Gonzalo Higuain",
        "Javier Mascherano",
        "Jorge Sampaoli",
        "Kun Agueero",
        "Lionel Messi",
        "Lucas Biglia",
        "Marcos Acuna",
        "Marcos Rojo",
        "Maximiliano Meza",
        "Nahuel Guzman",
        "Nicolas Otamendi",
        "Nicolas Tagliafico",
        "Paulo Dybala",
        "Willy Caballero"
      ], team_argentina
    )
    load_players(
      [
        "Aaron Mooy",
        "Andrew Nabbout",
        "Ante Milicic",
        "Anthony Franken",
        "Aziz Behich",
        "Bert Van marwijk",
        "Brad Jones",
        "Daniel Arzani",
        "Danny Vukovic",
        "Dimitri Petratos",
        "Jackson Irvine",
        "James Meredith",
        "Jamie Maclaren",
        "Joshua Risdon",
        "Mark Milligan",
        "Mark Van bommel",
        "Massimo Luongo",
        "Mathew Leckie",
        "Mathew Ryan",
        "Matthew Jurman",
        "Mile Jedinak",
        "Milos Degenek",
        "Robbie Kruse",
        "Roel Coumans",
        "Tim Cahill",
        "Tom Rogic",
        "Tomi Juric",
        "Trent Sainsbury"
      ], team_australia
    )
    load_players(
      [
        "Adnan Januzaj",
        "Axel Witsel",
        "Dedryck Boyata",
        "Dries Mertens",
        "Eden Hazard",
        "Jan Vertonghen",
        "Kevin De bruyne",
        "Koen Casteels",
        "Leander Dendoncker",
        "Marouane Fellaini",
        "Michy Batshuayi",
        "Mousa Dembele",
        "Nacer Chadli",
        "Roberto Martinez",
        "Romelu Lukaku",
        "Simon Mignolet",
        "Thibaut Courtois",
        "Thierry Henry",
        "Thomas Meunier",
        "Thomas Vermaelen",
        "Thorgan Hazard",
        "Toby Alderweireld",
        "Vincent Kompany",
        "Yannick Ferreira carrasco",
        "Youri Tielemans"
      ], team_belgium
    )
    load_players(
      [
        "Alisson",
        "Casemiro",
        "Cassio",
        "Coutinho",
        "Danilo",
        "Douglas Costa",
        "Ederson",
        "Fagner",
        "Fernandinho",
        "Filipe Luis",
        "Fred",
        "Gabriel Jesus",
        "Geromel",
        "Marcelo",
        "Marquinhos",
        "Miranda",
        "Neymar",
        "Paulinho",
        "Renato Augusto",
        "Roberto Firmino",
        "Taison",
        "Thiago Silva",
        "Tite",
        "Willian"
      ], team_brazil
    )
    load_players(
      [
        "Abel Aguilar",
        "Camilo Vargas",
        "Carlos Bacca",
        "Carlos Sanchez",
        "Cristian Zapata",
        "David Ospina",
        "Davinson Sanchez",
        "Farid Diaz",
        "James Rodriguez",
        "Jefferson Lerma",
        "Johan Mojica",
        "Jose Cuadrado",
        "Jose Izquierdo",
        "Jose Pekerman",
        "Juan Cuadrado",
        "Juan Quintero",
        "Luis Muriel",
        "Mateus Uribe",
        "Miguel Borja",
        "Oscar Murillo",
        "Radamel Falcao",
        "Santiago Arias",
        "Wilmar Barrios",
        "Yerry Mina"
      ], team_colombia
    )
    load_players(
      [
        "Bryan Oviedo",
        "Bryan Ruiz",
        "Celso Borges",
        "Christian Bolanos",
        "Cristian Gamboa",
        "Daniel Colindres",
        "David Guzman",
        "Francisco Calvo",
        "Giancarlo Gonzalez",
        "Ian Smith",
        "Joel Campbell",
        "Johan Venegas",
        "Johnny Acosta",
        "Kendall Waston",
        "Kenner Gutierrez",
        "Keylor Navas",
        "Leonel Moreira",
        "Marco Urena",
        "Oscar Duarte",
        "Oscar Ramirez",
        "Patrick Pemberton",
        "Randall Azofeifa",
        "Rodney Wallace",
        "Yeltsin Tejeda"
      ], team_costarica
    )
    load_players(
      [
        "Andrej Kramaric",
        "Ante Rebic",
        "Danijel Subasic",
        "Dejan Lovren",
        "Domagoj Vida",
        "Dominik Livakovic",
        "Drazen Ladic",
        "Duje Caleta car",
        "Filip Bradaric",
        "Ivan Perisic",
        "Ivan Rakitic",
        "Ivan Strinic",
        "Ivica Olic",
        "Josip Pivaric",
        "Lovre Kalinic",
        "Luka Modric",
        "Marcelo Brozovic",
        "Marijan Mrmic",
        "Mario Mandzukic",
        "Marko Pjaca",
        "Mateo Kovacic",
        "Milan Badelj",
        "Nikola Kalinic",
        "Sime Vrsaljko",
        "Tin Jedvaj",
        "Vedran Corluka",
        "Zlatko Dalic"
      ], team_croatia
    )
    load_players(
      [
        "Age Hareide",
        "Andreas Christensen",
        "Andreas Cornelius",
        "Christian Eriksen",
        "Frederik Roennow",
        "Henrik Dalsgaard",
        "Jannik Vestergaard",
        "Jens Stryger Larsen",
        "Jon Dahl Tomasson",
        "Jonas Knudsen",
        "Jonas Loessl",
        "Kasper Dolberg",
        "Kasper Schmeichel",
        "Lasse Schoene",
        "Lukas Lerager",
        "Martin Braithwaite",
        "Mathias Joergensen",
        "Michael Krohn Dehli",
        "Nicolai Joergensen",
        "Pione Sisto",
        "Simon Kjaer",
        "Thomas Delaney",
        "Viktor Fischer",
        "William Kvist",
        "Yussuf Poulsen"
      ], team_denmark
    )
    load_players(
      [
        "Ashley Young",
        "Danny Rose",
        "Danny Welbeck",
        "Dele Alli",
        "Eric Dier",
        "Fabian Delph",
        "Gareth Southgate",
        "Gary Cahill",
        "Harry Kane",
        "Harry Maguire",
        "Jack Butland",
        "Jamie Vardy",
        "Jesse Lingard",
        "John Stones",
        "Jordan Henderson",
        "Jordan Pickford",
        "Kieran Trippier",
        "Kyle Walker",
        "Marcus Rashford",
        "Nick Pope",
        "Phil Jones",
        "Raheem Sterling",
        "Ruben Loftus cheek",
        "Trent Alexander arnold"
      ], team_england
    )
    load_players(
      [
        "Abdulla El Said",
        "Ahmed Elmohamady",
        "Ahmed Fathy",
        "Ahmed Hegazy",
        "Ahmed Nagy",
        "Ali Gabr",
        "Amr Warda",
        "Ayman Ashraf",
        "Essam El hadary",
        "Hector Cuper",
        "Kahraba",
        "Mahmoud Hamdi",
        "Marwan Mohsen",
        "Mohamed Abdel Shafy",
        "Mohamed El Shenawy",
        "Mohamed Elneny",
        "Mohamed Salah",
        "Omar Gaber",
        "Ramadan Sobhi",
        "Saad Samir",
        "Sam Morsy",
        "Sherif Ekramy",
        "Shikabala",
        "Tarek Hamed",
        "Trezeguet"
      ], team_egypt
    )
    load_players(
      [
        "Adil Rami",
        "Alphonse Areola",
        "Antoine Griezmann",
        "Benjamin Mendy",
        "Benjamin Pavard",
        "Blaise Matuidi",
        "Corentin Tolisso",
        "Didier Deschamps",
        "Djibril Sidibe",
        "Florian Thauvin",
        "Franck Raviot",
        "Guy Stephan",
        "Hugo Lloris",
        "Kylian Mbappe",
        "Lucas Hernandez",
        "Nabil Fekir",
        "Ngolo Kante",
        "Olivier Giroud",
        "Ousmane Dembele",
        "Paul Pogba",
        "Presnel Kimpembe",
        "Raphael Varane",
        "Samuel Umtiti",
        "Steve Mandanda",
        "Steven Nzonzi",
        "Thomas Lemar",
      ], team_france
    )
    load_players(
      [
        "Andreas Koepke",
        "Antonio Ruediger",
        "Chad Forsythe",
        "Darcy Norman",
        "Jerome Boateng",
        "Joachim Loew",
        "Jonas Hector",
        "Joshua Kimmich",
        "Julian Brandt",
        "Julian Draxler",
        "Kevin Trapp",
        "Leon Goretzka",
        "Lkay Guendogan",
        "Manuel Neuer",
        "Marc Andre ter stegen",
        "Marco Reus",
        "Marcus Sorg",
        "Mario Gomez",
        "Mark Verstegen",
        "Marvin Plattenhardt",
        "Mats Hummels",
        "Matthias Ginter",
        "Mesut Oezil",
        "Miroslav Klose",
        "Nicklas Dietrich",
        "Niklas Suele",
        "Sami Khedira",
        "Sebastian Rudy",
        "Thomas Mueller",
        "Thomas Schneider",
        "Timo Werner",
        "Toni Kroos"
      ], team_germany
    )
    load_players(
      [
        "Alireza Beiranvand",
        "Alireza Jahanbakhsh",
        "Amir Abedzadeh",
        "Ashkan Dejagah",
        "Carlos Queiroz",
        "Ehsan Hajsafi",
        "Karim Ansarifard",
        "Majid Hosseini",
        "Masoud Shojaei",
        "Mehdi Taremi",
        "Mehdi Torabi",
        "Milad Mohammadi",
        "Mohammad Khanzadeh",
        "Mohammad Mazaheri",
        "Morteza Pouraliganji",
        "Omid Ebrahimi",
        "Pejman Montazeri",
        "Ramin Rezaeian",
        "Reza Ghoochannejhad",
        "Rouzbeh Cheshmi",
        "Saeid Ezatolahi",
        "Saman Ghoddos",
        "Sardar Azmoun",
        "Vahid Amiri"
      ], team_iran
    )
    load_players(
      [
        "Albert Gudmundsson",
        "Alfred Finnbogason",
        "Ari Skulason",
        "Arnor Ingvi traustason",
        "Aron Gunnarsson",
        "Birkir Bjarnason",
        "Birkir Saevarsson",
        "Bjoern Sigurdarson",
        "Emil Hallfredsson",
        "Frederik Schram",
        "Gylfi Sigurdsson",
        "Hannes Halldorsson",
        "Heimir Hallgrimsson",
        "Hoerdur Magnusson",
        "Holmar Eyjolfsson",
        "Johann Gudmundsson",
        "Jon Boedvarsson",
        "Kari Arnason",
        "Olafur Skulason",
        "Ragnar Sigurdsson",
        "Runar Runarsson",
        "Rurik Gislason",
        "Samuel Kari fridjonsson",
        "Sverrir Ingason"
      ], team_iceland
    )
    load_players(
      [
        "Akira Nishino",
        "Eiji Kawashima",
        "Gaku Shibasaki",
        "Gen Shoji",
        "Genki Haraguchi",
        "Gotoku Sakai",
        "Hiroki Sakai",
        "Hotaru Yamaguchi",
        "Keisuke Honda",
        "Kosuke Nakamura",
        "Makoto Hasebe",
        "Masaaki Higashiguchi",
        "Maya Yoshida",
        "Naomichi Ueda",
        "Ryota Oshima",
        "Shinji Kagawa",
        "Shinji Okazaki",
        "Takashi Inui",
        "Takashi Usami",
        "Tomoaki Makino",
        "Wataru Endo",
        "Yoshinori Muto",
        "Yuto Nagatomo",
        "Yuya Osako"
      ], team_japan
    )
    load_players(
      [
        "Ban Suk Oh",
        "Chul Hong",
        "Hee Chan Hwang",
        "Heung Min Son",
        "Hyun Soo Jang",
        "Hyun Woo Cho",
        "Ja Cheol Koo",
        "Jae Sung Lee Ii",
        "Jin Hyeon Kim",
        "Joo Ho Park",
        "Min Woo Kim",
        "See Jong Ju",
        "Seon Min Moon",
        "Seung Gyu Kim",
        "Seung Hyun Jung",
        "Seung Woo Lee",
        "Shin Wook Kim",
        "Sung Yueng Ki",
        "Tae Yong Shin",
        "Woo Young Jung",
        "Yo Han go",
        "Yong Lee",
        "Young Gwon Kim",
        "Young Sun Yun"
      ], team_korea
    )
    load_players(
      [
        "Achraf Hakimi",
        "Ahmed Tagnouti",
        "Amine Harit",
        "Ayoub El Kaabi",
        "Aziz Bouhaddouz",
        "Faycal Fajr",
        "Hakim Ziyech",
        "Hamza Mendyl",
        "Herve Renard",
        "Karim El Ahmadi",
        "Khalid Boutaib",
        "Manuel Da costa",
        "Mbark Boussoufa",
        "Medhi Benatia",
        "Mehdi Carcela Gonzalez",
        "Munir Mohamedi",
        "Nabil Dirar",
        "Nordin Amrabat",
        "Romain Saiss",
        "Sofyan Amrabat",
        "Yassine Bounou",
        "Younes Belhanda",
        "Youssef Ait Bennasser",
        "Youssef En Nesyri"
      ], team_morocco
    )
    load_players(
      [
        "Alfredo Talavera",
        "Andres Guardado",
        "Carlos Salcedo",
        "Carlos Vela",
        "Edson Alvarez",
        "Erick Gutierrez",
        "Giovani Dos santos",
        "Guillermo Ochoa",
        "Hector Herrera",
        "Hector Moreno",
        "Hirving Lozano",
        "Hugo Ayala",
        "Javier Aquino",
        "Javier Hernandez",
        "Jesus Corona",
        "Jesus Gallardo",
        "Jonathan Dos santos",
        "Jose Corona",
        "Juan Carlos osorio",
        "Marco Fabian",
        "Miguel Layun",
        "Oribe Peralta",
        "Rafael Marquez",
        "Raul Jimenez"
      ], team_mexico
    )
    load_players(
      [
        "Abdullahi Shehu",
        "Ahmed Musa",
        "Alex Iwobi",
        "Alloysius Agu",
        "Brian Idowu",
        "Chidozie Awaziem",
        "Daniel Akpeyi",
        "Elderson Echiejile",
        "Francis Uzoho",
        "Gernot Rohr",
        "Ikechukwu Ezenwa",
        "Joel Obi",
        "John Mikel",
        "John Ogu",
        "Kelechi Iheanacho",
        "Kenneth Omeruo",
        "Leon Balogun",
        "Odion Ighalo",
        "Ogenyi Onazi",
        "Peter Etebo",
        "Salisu Yusuf",
        "Simeon Nwankwo",
        "Tyronne Ebuehi",
        "Victor Moses",
        "Wilfred Ndidi",
        "William Troost Ekong"
      ], team_nigeria
    )
    load_players(
      [
        "Abdiel Arroyo",
        "Adolfo Machado",
        "Alex Rodriguez",
        "Anibal Godoy",
        "Armando Cooper",
        "Blas Perez",
        "Eric Davis",
        "Felipe Baloy",
        "Fidel Escobar",
        "Gabriel Gomez_2",
        "Gabriel Torres",
        "Harold Cummings",
        "Hernan Gomez",
        "Ismael Diaz",
        "Jaime Penedo",
        "Jose Calderon",
        "Jose Luis Rodriguez",
        "Luis Ovalle",
        "Luis Tejada",
        "Michael Murillo",
        "Ricardo Avila",
        "Roman Torres",
        "Valentin Pimentel",
        "Yoel Barcenas"
      ], team_panama
    )
    load_players(
      [
        "Alberto Rodriguez",
        "Aldo Corzo",
        "Anderson Santamaria",
        "Andre Carrillo",
        "Andy Polo",
        "Carlos Caceda",
        "Christian Cueva",
        "Christian Ramos",
        "Edison Flores",
        "Jefferson Farfan",
        "Jose Carvallo",
        "Luis Advincula",
        "Miguel Araujo",
        "Miguel Trauco",
        "Nilson Loyola",
        "Paolo Guerrero",
        "Paolo Hurtado",
        "Pedro Aquino",
        "Pedro Gallese",
        "Raul Ruidiaz",
        "Renato Tapia",
        "Ricardo Gareca",
        "Wilder Cartagena",
        "Yoshimar Yotun"
      ], team_peru
    )
    load_players(
      [
        "Adam Nawalka",
        "Arkadiusz Milik",
        "Artur Jedrzejczyk",
        "Bartosz Bereszynski",
        "Bartosz Bialkowski",
        "Dawid Kownacki",
        "Grzegorz Krychowiak",
        "Jacek Goralski",
        "Jakub Blaszczykowski",
        "Jan Bednarek",
        "Kamil Glik",
        "Kamil Grosicki",
        "Karol Linetty",
        "Lukasz Fabianski",
        "Lukasz Piszczek",
        "Lukasz Teodorczyk",
        "Maciej Rybus",
        "Michal Pazdan",
        "Piotr Zielinski",
        "Rafal Kurzawa",
        "Robert Lewandowski",
        "Slawomir Peszko",
        "Thiago Rangel cionek",
        "Wojciech Szczesny"
      ], team_poland
    )
    load_players(
      [
        "Adrien Silva",
        "Andre Silva",
        "Anthony Lopes",
        "Bernardo Silva",
        "Beto",
        "Bruno Alves",
        "Bruno Fernandes",
        "Cedric Soares",
        "Cristiano Ronaldo",
        "Fernando Santos",
        "Gelson Martins",
        "Goncalo Guedes",
        "Joao Mario",
        "Joao Moutinho",
        "Jose Fonte",
        "Manuel Fernandes",
        "Mario Rui",
        "Pepe",
        "Raphael Guerreiro",
        "Ricardo Pereira",
        "Ricardo Quaresma",
        "Ruben Dias",
        "Rui Patricio",
        "William Carvalho"
      ], team_portugal
    )
    load_players(
      [
        "Alan Dzagoev",
        "Aleksandr Erokhin",
        "Aleksandr Golovin",
        "Aleksandr Samedov",
        "Aleksey Miranchuk",
        "Andrei Lunev",
        "Andrei Semyonov",
        "Anton Miranchuk",
        "Artem Dzyuba",
        "Daler Kuzyaev",
        "Denis Cheryshev",
        "Fedor Kudryashov",
        "Fedor Smolov",
        "Gintaras Stauc",
        "Igor Akinfeev",
        "Igor Smolnikov",
        "Ilya Kutepov",
        "Mario Fernandes",
        "Miroslav Romashchenko",
        "Roman Zobnin",
        "Sergey Ignashevich",
        "Stanislav Cherchesov",
        "Vladimir Gabulov",
        "Vladimir Granat",
        "Yuri Gazinskiy",
        "Yuriy Zhirkov"
      ], team_russia
    )
    load_players(
      [
        "Abdullah Al Khaibari",
        "Abdullah Al Muaiouf",
        "Abdullah Otayf",
        "Abdulmalek Al Khaibri",
        "Ali Al Bulaihi",
        "Fahad Al Muwallad",
        "Hattan Babhir",
        "Housain Al Moqahwi",
        "Juan Pizzi",
        "Mansour Al Harbi",
        "Mohammad Al Sahlawi",
        "Mohammed Al Burayk",
        "Mohammed Al Owais",
        "Mohammed Kanno",
        "Motaz Hawsawi",
        "Muhannad Assiri",
        "Omar Hawsawi",
        "Osama Hawsawi",
        "Salem Al Dawsari",
        "Salman Al Faraj",
        "Taisir Al Jassim",
        "Yahya Al Shehri",
        "Yaser Al Mosailem",
        "Yasir Al Shahrani"
      ], team_saudi
    )
    load_players(
      [
        "Albin Ekdal",
        "Andreas Granqvist",
        "Emil Forsberg",
        "Emil Krafth",
        "Filip Helander",
        "Gustav Svensson",
        "Isaac Thelin",
        "Janne Andersson",
        "Jimmy Durmaz",
        "John Guidetti",
        "Kalle Johnsson",
        "Kristoffer Nordfeldt",
        "Ludwig Augustinsson",
        "Marcus Berg",
        "Marcus Rohden",
        "Martin Olsson",
        "Mikael Lustig",
        "Ola Toivonen",
        "Oscar Hiljemark",
        "Pontus Jansson",
        "Robin Olsen",
        "Sebastian Larsson",
        "Victor Claesson",
        "Victor Lindeloef"
      ], team_sweden
    )
    load_players(
      [
        "Abdoulaye Diallo",
        "Adama Mbengue",
        "Alfred Gomis",
        "Alfred Ndiaye",
        "Aliou Cisse",
        "Cheikh Ndoye",
        "Cheikhou Kouyate",
        "Diafra Sakho",
        "Idrissa Gueye",
        "Ismaila Sarr",
        "Kalidou Koulibaly",
        "Keita Balde",
        "Khadim Ndiaye",
        "Lamine Gassama",
        "Mame Diouf",
        "Mbaye Niang",
        "Moussa Konate",
        "Moussa Sow",
        "Moussa Wague",
        "Papa Ndiaye_2",
        "Sadio Mane",
        "Salif Sane",
        "Serigne Mbodj",
        "Youssouf Sabaly"
      ], team_senegal
    )
    load_players(
      [
        "Adem Ljajic",
        "Aleksandar Kolarov",
        "Aleksandar Mitrovic",
        "Aleksandar Prijovic",
        "Andrija Zivkovic",
        "Antonio Rukavina",
        "Branislav Ivanovic",
        "Dusan Tadic",
        "Dusko Tosic",
        "Filip Kostic",
        "Luka Jovic",
        "Luka Milivojevic",
        "Marko Dmitrovic",
        "Marko Grujic",
        "Milan Rodic",
        "Milos Veljkovic",
        "Mladen Krstajic",
        "Nemanja Matic",
        "Nemanja Radonjic",
        "Nikola Milenkovic",
        "Predrag Rajkovic",
        "Sergej Milinkovic savic",
        "Uros Spajic",
        "Vladimir Stojkovic"
      ], team_serbia
    )
    load_players(
      [
        "Azpilicueta",
        "Busquets",
        "Dani Carvajal",
        "David Silva",
        "De Gea",
        "Diego Costa",
        "Hierro",
        "Iago Aspas",
        "Iniesta",
        "Isco",
        "Jordi Alba",
        "Julian Calero",
        "Kepa",
        "Koke",
        "Lucas Vazquez",
        "Marchena",
        "Marco Asensio",
        "Nacho Monreal",
        "Nacho",
        "Ochotorena",
        "Odriozola",
        "Pepe Reina",
        "Pique",
        "Rodrigo",
        "Saul",
        "Sergio Ramos",
        "Thiago"
      ], team_spain
    )
    load_players(
      [
        "Blerim Dzemaili",
        "Breel Embolo",
        "Denis Zakaria",
        "Fabian Schaer",
        "Francois Moubandje",
        "Gelson Fernandes",
        "Granit Xhaka",
        "Haris Seferovic",
        "Johan Djourou",
        "Josip Drmic",
        "Manuel Akanji",
        "Mario Gavranovic",
        "Michael Lang",
        "Nico Elvedi",
        "Remo Freuler",
        "Ricardo Rodriguez",
        "Roman Buerki",
        "Stephan Lichtsteiner",
        "Steven Zuber",
        "Valon Behrami",
        "Vladimir Petkovic",
        "Xherdan Shaqiri",
        "Yann Sommer",
        "Yvon Mvogo"
     ], team_switzerland
   )
    load_players(
      [
        "Ahmed Khalil",
        "Ali Maaloul",
        "Anice Badri",
        "Aymen Mathlouthi",
        "Bassem Srarfi",
        "Dylan Bronn",
        "Ellyes Skhiri",
        "Fakhreddine Ben Youssef",
        "Farouk Ben Mustapha",
        "Ferjani Sassi",
        "Ghaylene Chaalali",
        "Hamdi Nagguez",
        "Mohamed Ben amor",
        "Mouez Hassen",
        "Nabil Maaloul",
        "Naim Sliti",
        "Oussema Haddadi",
        "Rami Bedoui",
        "Saber Khalifa",
        "Saif Eddine khaoui",
        "Syam Ben youssef",
        "Wahbi Khazri",
        "Yassine Meryah",
        "Yohan Benalouane"
      ], team_tunisia
    )
    load_players(
      [
        "Carlos Andrés Sanchez",
        "Cristhian Stuani",
        "Cristian Rodriguez",
        "Diego Godin",
        "Diego Laxalt",
        "Edinson Cavani",
        "Fernando Muslera",
        "Gaston Silva",
        "Giorgian De arrascaeta",
        "Guillermo Varela",
        "Jonathan Urreta",
        "Jose Gimenez",
        "Lucas Torreira",
        "Luis Suarez",
        "Martin Caceres",
        "Martin Campana",
        "Martin Silva",
        "Matias Vecino",
        "Maximiliano Gomez",
        "Maximiliano Pereira",
        "Nahitan Nandez",
        "Oscar Tabarez",
        "Rodrigo Bentancur",
        "Sebastian Coates"
      ], team_uruguay
    )

    city_ekaterinburg   = Repo.insert! %City{ name: "Ekaterinburg"    }
    city_kalingrad      = Repo.insert! %City{ name: "Kaliningrad"     }
    city_kazan          = Repo.insert! %City{ name: "Kazan"           }
    city_moskva         = Repo.insert! %City{ name: "Moskva"          }
    city_nizhnynovgorod = Repo.insert! %City{ name: "Nizhny Novgorod" }
    city_rostov         = Repo.insert! %City{ name: "Rostov"          }
    city_samara         = Repo.insert! %City{ name: "Samara"          }
    city_saransk        = Repo.insert! %City{ name: "Saransk"         }
    city_sochi          = Repo.insert! %City{ name: "Sochi"           }
    city_stpetersburg   = Repo.insert! %City{ name: "St.Petersburg"   }
    city_volgograd      = Repo.insert! %City{ name: "Volgograd"       }

    stadium_baltika = Repo.insert! %Stadium{
      name:     "Arena Baltika",
      capacity: 35_000,
      city:     city_kalingrad
    }
    stadium_centrlniy = Repo.insert! %Stadium{
      name:     "Centralniy",
      capacity: 32_120,
      city:     city_volgograd
    }
    stadium_cosmos = Repo.insert! %Stadium{
      name:     "Cosmos Arena",
      capacity: 44_918,
      city:     city_samara
    }
    stadium_kazan = Repo.insert! %Stadium{
      name:     "Kazan Arena",
      capacity: 45_105,
      city:     city_kazan
    }
    stadium_krestovsky = Repo.insert! %Stadium{
      name:     "Krestovsky",
      capacity: 66_881,
      city:     city_stpetersburg
    }
    stadium_levberdon = Repo.insert! %Stadium{
      name:     "Levberdon Arena",
      capacity: 45_000,
      city:     city_rostov
    }
    stadium_luzhniki = Repo.insert! %Stadium{
      name:     "Luzhniki",
      capacity: 80_840,
      city:     city_moskva
    }
    stadium_mordovia = Repo.insert! %Stadium{
      name:     "Mordovia Arena",
      capacity: 45_015,
      city:     city_saransk
    }
    stadium_olimpiyskiy = Repo.insert! %Stadium{
      name:     "Olimpiyskiy Stadion",
      capacity: 47_659,
      city:     city_sochi
    }
    stadium_otkrytie = Repo.insert! %Stadium{
      name:     "Otkrytie Arena",
      capacity: 44_929,
      city:     city_moskva
    }
    stadium_nizhny = Repo.insert! %Stadium{
      name:     "Stadion Nizhny Novgorod",
      capacity: 44_899,
      city:     city_nizhnynovgorod
    }
    stadium_tsentralnyi = Repo.insert! %Stadium{
      name:     "Stadion Tsentralnyi",
      capacity: 35_696,
      city:     city_ekaterinburg
    }

    method_back_heel   = Repo.insert! %Method{ name: "back heel"          }
    method_free_kick   = Repo.insert! %Method{ name: "free kick"          }
    method_ifree_kick  = Repo.insert! %Method{ name: "indirect free kick" }
    method_header      = Repo.insert! %Method{ name: "header"             }
    method_left_foot   = Repo.insert! %Method{ name: "left-footed shot"   }
    method_own_goal    = Repo.insert! %Method{ name: "own goal"           }
    method_penalty     = Repo.insert! %Method{ name: "penalty"            }
    method_right_foot  = Repo.insert! %Method{ name: "right-footed shot"  }
#                                   GROUP A
    match_russia_saudi = Repo.insert! %Match{
      playtime: ~N[2018-06-14 16:00:00],
      result: "5-0",
      stadium: stadium_luzhniki,
      home_team: team_russia,
      away_team: team_saudi
    }
    Repo.insert %Goal{
      match_id: match_russia_saudi.id,
      match_minute: 12,
      method: method_header,
      player: Repo.get_by(Player, name: "Yuri Gazinskiy")
    }
    Repo.insert %Goal{
      match_id: match_russia_saudi.id,
      match_minute: 43,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Denis Cheryshev")
    }
    Repo.insert %Goal{
      match_id: match_russia_saudi.id,
      match_minute: 71,
      method: method_header,
      player: Repo.get_by(Player, name: "Artem Dzyuba")
    }
    Repo.insert %Goal{
      match_id: match_russia_saudi.id,
      match_minute: 90,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Denis Cheryshev")
    }
    Repo.insert %Goal{
      match_id: match_russia_saudi.id,
      match_minute: 90,
      method: method_free_kick,
      player: Repo.get_by(Player, name: "Aleksandr Golovin")
    }

    match_egypt_uruguay = Repo.insert! %Match{
      playtime: ~N[2018-06-15 13:00:00],
      result: "0-1",
      stadium: stadium_tsentralnyi,
      home_team: team_egypt,
      away_team: team_uruguay
    }

    Repo.insert %Goal{
      match_id: match_egypt_uruguay.id,
      match_minute: 90,
      method: method_header,
      player: Repo.get_by(Player, name: "Carlos Andrés Sanchez")
    }

    match_russia_egypt = Repo.insert! %Match{
      playtime: ~N[2018-06-19 19:00:00],
      result: "3-1",
      stadium: stadium_krestovsky,
      home_team: team_russia,
      away_team: team_egypt
    }
    Repo.insert %Goal{
      match_id: match_russia_egypt.id,
      match_minute: 47,
      method: method_own_goal,
      player: Repo.get_by(Player, name: "Ahmed Fathy")
    }
    Repo.insert %Goal{
      match_id: match_russia_egypt.id,
      match_minute: 59,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Denis Cheryshev")
    }
    Repo.insert %Goal{
      match_id: match_russia_egypt.id,
      match_minute: 62,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Ilya Kutepov")
    }
    Repo.insert %Goal{
      match_id: match_russia_egypt.id,
      match_minute: 73,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Mohamed Salah")
    }

    match_uruguay_saudi = Repo.insert! %Match{
      playtime: ~N[2018-06-20 16:00:00],
      result: "1-0",
      stadium: stadium_levberdon,
      home_team: team_uruguay,
      away_team: team_saudi
    }
    Repo.insert %Goal{
      match_id: match_uruguay_saudi.id,
      match_minute: 23,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Luis Suarez")
    }

    match_uruguay_russia = Repo.insert! %Match{
      playtime: ~N[2018-06-25 15:00:00],
      result: "1-0",
      stadium: stadium_cosmos,
      home_team: team_uruguay,
      away_team: team_russia
    }
    Repo.insert %Goal{
      match_id: match_uruguay_russia.id,
      match_minute: 10,
      method: method_free_kick,
      player: Repo.get_by(Player, name: "Luis Suarez")
    }
    Repo.insert %Goal{
      match_id: match_uruguay_russia.id,
      match_minute: 23,
      method: method_own_goal,
      player: Repo.get_by(Player, name: "Denis Cheryshev")
    }
    Repo.insert %Goal{
      match_id: match_uruguay_russia.id,
      match_minute: 90,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Edinson Cavani")
    }

    match_saudi_egypt = Repo.insert! %Match{
      playtime: ~N[2018-06-25 15:00:00],
      result: "2-1",
      stadium: stadium_centrlniy,
      home_team: team_saudi,
      away_team: team_egypt
    }
    Repo.insert %Goal{
      match_id: match_saudi_egypt.id,
      match_minute: 22,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Mohamed Salah")
    }
    Repo.insert %Goal{
      match_id: match_saudi_egypt.id,
      match_minute: 45,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Salman Al Faraj")
    }
    Repo.insert %Goal{
      match_id: match_saudi_egypt.id,
      match_minute: 90,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Salem Al Dawsari")
    }
#                                   GROUP B
    match_morocco_iran = Repo.insert! %Match{
      playtime: ~N[2018-06-15 16:00:00],
      result: "0-1",
      stadium: stadium_krestovsky,
      home_team: team_morocco,
      away_team: team_iran
    }
    Repo.insert %Goal{
      match_id: match_morocco_iran.id,
      match_minute: 90,
      method: method_own_goal,
      player: Repo.get_by(Player, name: "Aziz Bouhaddouz")
    }

    match_portugal_spain = Repo.insert! %Match{
      playtime: ~N[2018-06-15 19:00:00],
      result: "3-3",
      stadium: stadium_olimpiyskiy,
      home_team: team_portugal,
      away_team: team_spain
    }
    Repo.insert %Goal{
      match_id: match_portugal_spain.id,
      match_minute: 4,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Cristiano Ronaldo")
    }
    Repo.insert %Goal{
      match_id: match_portugal_spain.id,
      match_minute: 24,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Diego Costa")
    }
    Repo.insert %Goal{
      match_id: match_portugal_spain.id,
      match_minute: 44,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Cristiano Ronaldo")
    }
    Repo.insert %Goal{
      match_id: match_portugal_spain.id,
      match_minute: 55,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Diego Costa")
    }
    Repo.insert %Goal{
      match_id: match_portugal_spain.id,
      match_minute: 58,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Nacho")
    }
    Repo.insert %Goal{
      match_id: match_portugal_spain.id,
      match_minute: 88,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Cristiano Ronaldo")
    }

    match_portugal_morocco = Repo.insert! %Match{
      playtime: ~N[2018-06-20 13:00:00],
      result: "3-3",
      stadium: stadium_luzhniki,
      home_team: team_portugal,
      away_team: team_morocco
    }
    Repo.insert %Goal{
      match_id: match_portugal_morocco.id,
      match_minute: 4,
      method: method_header,
      player: Repo.get_by(Player, name: "Cristiano Ronaldo")
    }

    match_iran_spain = Repo.insert! %Match{
      playtime: ~N[2018-06-20 19:00:00],
      result: "0-1",
      stadium: stadium_kazan,
      home_team: team_iran,
      away_team: team_spain
    }
    Repo.insert %Goal{
      match_id: match_iran_spain.id,
      match_minute: 54,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Diego Costa")
    }

    match_spain_morocco = Repo.insert! %Match{
      playtime: ~N[2018-06-25 19:00:00],
      result: "2-2",
      stadium: stadium_baltika,
      home_team: team_spain,
      away_team: team_morocco
    }
    Repo.insert %Goal{
      match_id: match_spain_morocco.id,
      match_minute: 14,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Khalid Boutaib")
    }
    Repo.insert %Goal{
      match_id: match_spain_morocco.id,
      match_minute: 19,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Isco")
    }
    Repo.insert %Goal{
      match_id: match_spain_morocco.id,
      match_minute: 81,
      method: method_header,
      player: Repo.get_by(Player, name: "Youssef En Nesyri")
    }
    Repo.insert %Goal{
      match_id: match_spain_morocco.id,
      match_minute: 90,
      method: method_back_heel,
      player: Repo.get_by(Player, name: "Iago Aspas")
    }

    match_iran_portugal= Repo.insert! %Match{
      playtime: ~N[2018-06-25 19:00:00],
      result: "1-1",
      stadium: stadium_mordovia,
      home_team: team_iran,
      away_team: team_portugal
    }
    Repo.insert %Goal{
      match_id: match_iran_portugal.id,
      match_minute: 45,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Ricardo Quaresma")
    }
    Repo.insert %Goal{
      match_id: match_iran_portugal.id,
      match_minute: 90,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Karim Ansarifard")
    }
#                                   GROUP C
    match_france_australia = Repo.insert! %Match{
      playtime: ~N[2018-06-16 11:00:00],
      result: "2-1",
      stadium: stadium_kazan,
      home_team: team_france,
      away_team: team_australia
    }
    Repo.insert %Goal{
      match_id: match_france_australia.id,
      match_minute: 58,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Antoine Griezmann")
    }
    Repo.insert %Goal{
      match_id: match_france_australia.id,
      match_minute: 62,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Mile Jedinak")
    }
    Repo.insert %Goal{
      match_id: match_france_australia.id,
      match_minute: 80,
      method: method_own_goal,
      player: Repo.get_by(Player, name: "Aziz Behich")
    }

    match_peru_denmark = Repo.insert! %Match{
      playtime: ~N[2018-06-16 17:00:00],
      result: "0-1",
      stadium: stadium_mordovia,
      home_team: team_peru,
      away_team: team_denmark
    }
    Repo.insert %Goal{
      match_id: match_peru_denmark.id,
      match_minute: 59,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Yussuf Poulsen")
    }

    match_denmark_australia = Repo.insert! %Match{
      playtime: ~N[2018-06-21 13:00:00],
      result: "1-1",
      stadium: stadium_cosmos,
      home_team: team_denmark,
      away_team: team_australia
    }
    Repo.insert %Goal{
      match_id: match_denmark_australia.id,
      match_minute: 7,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Nicolai Joergensen")
    }
    Repo.insert %Goal{
      match_id: match_denmark_australia.id,
      match_minute: 38,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Mile Jedinak")
    }

    match_france_peru = Repo.insert! %Match{
      playtime: ~N[2018-06-21 16:00:00],
      result: "1-0",
      stadium: stadium_tsentralnyi,
      home_team: team_france,
      away_team: team_peru
    }
    Repo.insert %Goal{
      match_id: match_france_peru.id,
      match_minute: 34,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Kylian Mbappe")
    }

    _match_denmark_france = Repo.insert! %Match{
      playtime: ~N[2018-06-26 15:00:00],
      result: "0-0",
      stadium: stadium_luzhniki,
      home_team: team_denmark,
      away_team: team_france
    }

    match_australia_peru = Repo.insert! %Match{
      playtime: ~N[2018-06-26 15:00:00],
      result: "0-2",
      stadium: stadium_olimpiyskiy,
      home_team: team_australia,
      away_team: team_peru
    }
    Repo.insert %Goal{
      match_id: match_australia_peru.id,
      match_minute: 18,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Andre Carrillo")
    }
    Repo.insert %Goal{
      match_id: match_australia_peru.id,
      match_minute: 50,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Paolo Guerrero")
    }
#                                   GROUP D
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
    Repo.insert %Goal{
      match_id: match_argentina_iceland.id,
      match_minute: 23,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Alfred Finnbogason")
    }

    match_croatia_nigeria = Repo.insert! %Match{
      playtime: ~N[2018-06-16 20:00:00],
      result: "2-0",
      stadium: stadium_baltika,
      home_team: team_croatia,
      away_team: team_nigeria
    }
    Repo.insert %Goal{
      match_id: match_croatia_nigeria.id,
      match_minute: 32,
      method: method_own_goal,
      player: Repo.get_by(Player, name: "Peter Etebo")
    }
    Repo.insert %Goal{
      match_id: match_croatia_nigeria.id,
      match_minute: 71,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Luka Modric")
    }

    match_argentina_croatia = Repo.insert! %Match{
      playtime: ~N[2018-06-21 19:00:00],
      result: "0-3",
      stadium: stadium_nizhny,
      home_team: team_argentina,
      away_team: team_croatia
    }
    Repo.insert %Goal{
      match_id: match_argentina_croatia.id,
      match_minute: 53,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Ante Rebic")
    }
    Repo.insert %Goal{
      match_id: match_argentina_croatia.id,
      match_minute: 80,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Luka Modric")
    }
    Repo.insert %Goal{
      match_id: match_argentina_croatia.id,
      match_minute: 90,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Ivan Rakitic")
    }

    match_nigeria_iceland = Repo.insert! %Match{
      playtime: ~N[2018-06-22 16:00:00],
      result: "2-0",
      stadium: stadium_centrlniy,
      home_team: team_nigeria,
      away_team: team_iceland
    }
    Repo.insert %Goal{
      match_id: match_nigeria_iceland.id,
      match_minute: 49,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Ahmed Musa")
    }
    Repo.insert %Goal{
      match_id: match_nigeria_iceland.id,
      match_minute: 75,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Ahmed Musa")
    }

    match_iceland_croatia = Repo.insert! %Match{
      playtime: ~N[2018-06-26 19:00:00],
      result: "1-2",
      stadium: stadium_levberdon,
      home_team: team_iceland,
      away_team: team_croatia
    }
    Repo.insert %Goal{
      match_id: match_iceland_croatia.id,
      match_minute: 53,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Milan Badelj")
    }
    Repo.insert %Goal{
      match_id: match_iceland_croatia.id,
      match_minute: 76,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Gylfi Sigurdsson")
    }
    Repo.insert %Goal{
      match_id: match_iceland_croatia.id,
      match_minute: 90,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Ivan Perisic")
    }

    match_nigeria_argentina = Repo.insert! %Match{
      playtime: ~N[2018-06-26 19:00:00],
      result: "1-2",
      stadium: stadium_krestovsky,
      home_team: team_nigeria,
      away_team: team_argentina
    }
    Repo.insert %Goal{
      match_id: match_nigeria_argentina.id,
      match_minute: 14,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Lionel Messi")
    }
    Repo.insert %Goal{
      match_id: match_nigeria_argentina.id,
      match_minute: 51,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Victor Moses")
    }
    Repo.insert %Goal{
      match_id: match_nigeria_argentina.id,
      match_minute: 86,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Marcos Rojo")
    }
#                                   GROUP E
    match_costarica_serbia = Repo.insert! %Match{
      playtime: ~N[2018-06-17 13:00:00],
      result: "1-2",
      stadium: stadium_cosmos,
      home_team: team_costarica,
      away_team: team_serbia
    }
    Repo.insert %Goal{
      match_id: match_costarica_serbia.id,
      match_minute: 56,
      method: method_free_kick,
      player: Repo.get_by(Player, name: "Aleksandar Kolarov")
    }

    match_brazil_switzerland = Repo.insert! %Match{
      playtime: ~N[2018-06-17 19:00:00],
      result: "1-1",
      stadium: stadium_levberdon,
      home_team: team_brazil,
      away_team: team_switzerland
    }
    Repo.insert %Goal{
      match_id: match_brazil_switzerland.id,
      match_minute: 20,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Coutinho")
    }
    Repo.insert %Goal{
      match_id: match_brazil_switzerland.id,
      match_minute: 50,
      method: method_header,
      player: Repo.get_by(Player, name: "Steven Zuber")
    }

    match_brazil_costarica = Repo.insert! %Match{
      playtime: ~N[2018-06-22 13:00:00],
      result: "2-0",
      stadium: stadium_krestovsky,
      home_team: team_brazil,
      away_team: team_costarica
    }
    Repo.insert %Goal{
      match_id: match_brazil_costarica.id,
      match_minute: 90,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Coutinho")
    }
    Repo.insert %Goal{
      match_id: match_brazil_costarica.id,
      match_minute: 90,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Neymar")
    }

    match_serbia_switzerland = Repo.insert! %Match{
      playtime: ~N[2018-06-22 19:00:00],
      result: "1-2",
      stadium: stadium_baltika,
      home_team: team_serbia,
      away_team: team_switzerland
    }
    Repo.insert %Goal{
      match_id: match_serbia_switzerland.id,
      match_minute: 5,
      method: method_header,
      player: Repo.get_by(Player, name: "Aleksandar Mitrovic")
    }
    Repo.insert %Goal{
      match_id: match_serbia_switzerland.id,
      match_minute: 52,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Granit Xhaka")
    }
    Repo.insert %Goal{
      match_id: match_serbia_switzerland.id,
      match_minute: 90,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Xherdan Shaqiri")
    }

    match_serbia_brazil = Repo.insert! %Match{
      playtime: ~N[2018-06-27 19:00:00],
      result: "0-2",
      stadium: stadium_otkrytie,
      home_team: team_serbia,
      away_team: team_brazil
    }
    Repo.insert %Goal{
      match_id: match_serbia_brazil.id,
      match_minute: 36,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Paulinho")
    }
    Repo.insert %Goal{
      match_id: match_serbia_brazil.id,
      match_minute: 68,
      method: method_header,
      player: Repo.get_by(Player, name: "Thiago Silva")
    }

    match_switzerland_costarica = Repo.insert! %Match{
      playtime: ~N[2018-06-27 19:00:00],
      result: "2-2",
      stadium: stadium_nizhny,
      home_team: team_switzerland,
      away_team: team_costarica
    }
    Repo.insert %Goal{
      match_id: match_switzerland_costarica.id,
      match_minute: 31,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Blerim Dzemaili")
    }
    Repo.insert %Goal{
      match_id: match_switzerland_costarica.id,
      match_minute: 56,
      method: method_header,
      player: Repo.get_by(Player, name: "Kendall Waston")
    }
    Repo.insert %Goal{
      match_id: match_switzerland_costarica.id,
      match_minute: 88,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Josip Drmic")
    }
    Repo.insert %Goal{
      match_id: match_switzerland_costarica.id,
      match_minute: 90,
      method: method_own_goal,
      player: Repo.get_by(Player, name: "Yann Sommer")
    }
#                                   GROUP F
    match_germany_mexico = Repo.insert! %Match{
      playtime: ~N[2018-06-17 16:00:00],
      result: "0-1",
      stadium: stadium_luzhniki,
      home_team: team_germany,
      away_team: team_mexico
    }
    Repo.insert %Goal{
      match_id: match_germany_mexico.id,
      match_minute: 35,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Hirving Lozano")
    }

    match_sweden_korea = Repo.insert! %Match{
      playtime: ~N[2018-06-18 13:00:00],
      result: "1-0",
      stadium: stadium_nizhny,
      home_team: team_sweden,
      away_team: team_korea,
    }
    Repo.insert %Goal{
      match_id: match_sweden_korea.id,
      match_minute: 65,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Andreas Granqvist")
    }

    match_korea_mexico = Repo.insert! %Match{
      playtime: ~N[2018-06-23 16:00:00],
      result: "1-2",
      stadium: stadium_levberdon,
      home_team: team_korea,
      away_team: team_mexico
    }
    Repo.insert %Goal{
      match_id: match_korea_mexico.id,
      match_minute: 26,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Carlos Vela")
    }
    Repo.insert %Goal{
      match_id: match_korea_mexico.id,
      match_minute: 66,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Javier Hernandez")
    }
    Repo.insert %Goal{
      match_id: match_korea_mexico.id,
      match_minute: 90,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Heung Min Son")
    }

    match_germany_sweden = Repo.insert! %Match{
      playtime: ~N[2018-06-23 19:00:00],
      result: "2-1",
      stadium: stadium_olimpiyskiy,
      home_team: team_germany,
      away_team: team_sweden
    }
    Repo.insert %Goal{
      match_id: match_germany_sweden.id,
      match_minute: 32,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Ola Toivonen")
    }
    Repo.insert %Goal{
      match_id: match_germany_sweden.id,
      match_minute: 48,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Marco Reus")
    }
    Repo.insert %Goal{
      match_id: match_germany_sweden.id,
      match_minute: 90,
      method: method_ifree_kick,
      player: Repo.get_by(Player, name: "Toni Kroos")
    }

    match_mexico_sweden = Repo.insert! %Match{
      playtime: ~N[2018-06-27 15:00:00],
      result: "0-3",
      stadium: stadium_tsentralnyi,
      home_team: team_mexico,
      away_team: team_sweden
    }
    Repo.insert %Goal{
      match_id: match_mexico_sweden.id,
      match_minute: 50,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Ludwig Augustinsson")
    }
    Repo.insert %Goal{
      match_id: match_mexico_sweden.id,
      match_minute: 62,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Andreas Granqvist")
    }
    Repo.insert %Goal{
      match_id: match_mexico_sweden.id,
      match_minute: 74,
      method: method_own_goal,
      player: Repo.get_by(Player, name: "Edson Alvarez")
    }

    match_korea_germany = Repo.insert! %Match{
      playtime: ~N[2018-06-27 15:00:00],
      result: "2-0",
      stadium: stadium_kazan,
      home_team: team_korea,
      away_team: team_sweden
    }
    Repo.insert %Goal{
      match_id: match_korea_germany.id,
      match_minute: 90,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Young Gwon Kim")
    }
    Repo.insert %Goal{
      match_id: match_korea_germany.id,
      match_minute: 90,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Heung Min Son")
    }
#                                   GROUP G
    match_belgium_panama = Repo.insert! %Match{
      playtime: ~N[2018-06-18 16:00:00],
      result: "3-0",
      stadium: stadium_olimpiyskiy,
      home_team: team_belgium,
      away_team: team_panama
    }
    Repo.insert %Goal{
      match_id: match_belgium_panama.id,
      match_minute: 47,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Dries Mertens")
    }
    Repo.insert %Goal{
      match_id: match_belgium_panama.id,
      match_minute: 69,
      method: method_header,
      player: Repo.get_by(Player, name: "Romelu Lukaku")
    }
    Repo.insert %Goal{
      match_id: match_belgium_panama.id,
      match_minute: 75,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Romelu Lukaku")
    }

    match_tunisia_england = Repo.insert! %Match{
      playtime: ~N[2018-06-18 19:00:00],
      result: "1-2",
      stadium: stadium_centrlniy,
      home_team: team_tunisia,
      away_team: team_england
    }
    Repo.insert %Goal{
      match_id: match_tunisia_england.id,
      match_minute: 11,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Harry Kane")
    }
    Repo.insert %Goal{
      match_id: match_tunisia_england.id,
      match_minute: 35,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Ferjani Sassi")
    }
    Repo.insert %Goal{
      match_id: match_tunisia_england.id,
      match_minute: 90,
      method: method_header,
      player: Repo.get_by(Player, name: "Harry Kane")
    }

    match_belgium_tunisia = Repo.insert! %Match{
      playtime: ~N[2018-06-23 13:00:00],
      result: "5-2",
      stadium: stadium_otkrytie,
      home_team: team_belgium,
      away_team: team_tunisia
    }
    Repo.insert %Goal{
      match_id: match_belgium_tunisia.id,
      match_minute: 7,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Eden Hazard")
    }
    Repo.insert %Goal{
      match_id: match_belgium_tunisia.id,
      match_minute: 16,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Romelu Lukaku")
    }
    Repo.insert %Goal{
      match_id: match_belgium_tunisia.id,
      match_minute: 18,
      method: method_header,
      player: Repo.get_by(Player, name: "Dylan Bronn")
    }
    Repo.insert %Goal{
      match_id: match_belgium_tunisia.id,
      match_minute: 45,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Romelu Lukaku")
    }
    Repo.insert %Goal{
      match_id: match_belgium_tunisia.id,
      match_minute: 51,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Eden Hazard")
    }
    Repo.insert %Goal{
      match_id: match_belgium_tunisia.id,
      match_minute: 90,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Michy Batshuayi")
    }
    Repo.insert %Goal{
      match_id: match_belgium_tunisia.id,
      match_minute: 90,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Wahbi Khazri")
    }

    match_england_panama = Repo.insert! %Match{
      playtime: ~N[2018-06-24 13:00:00],
      result: "6-1",
      stadium: stadium_nizhny,
      home_team: team_england,
      away_team: team_panama
    }
    Repo.insert %Goal{
      match_id: match_england_panama.id,
      match_minute: 8,
      method: method_header,
      player: Repo.get_by(Player, name: "John Stones")
    }
    Repo.insert %Goal{
      match_id: match_england_panama.id,
      match_minute: 22,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Harry Kane")
    }
    Repo.insert %Goal{
      match_id: match_england_panama.id,
      match_minute: 36,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Jesse Lingard")
    }
    Repo.insert %Goal{
      match_id: match_england_panama.id,
      match_minute: 40,
      method: method_header,
      player: Repo.get_by(Player, name: "John Stones")
    }
    Repo.insert %Goal{
      match_id: match_england_panama.id,
      match_minute: 45,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Harry Kane")
    }
    Repo.insert %Goal{
      match_id: match_england_panama.id,
      match_minute: 62,
      method: method_back_heel,
      player: Repo.get_by(Player, name: "Harry Kane")
    }
    Repo.insert %Goal{
      match_id: match_england_panama.id,
      match_minute: 78,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Felipe Baloy")
    }

    match_england_belgium = Repo.insert! %Match{
      playtime: ~N[2018-06-28 19:00:00],
      result: "0-1",
      stadium: stadium_baltika,
      home_team: team_england,
      away_team: team_belgium
    }
    Repo.insert %Goal{
      match_id: match_england_belgium.id,
      match_minute: 50,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Adnan Januzaj")
    }

    match_panama_tunisia = Repo.insert! %Match{
      playtime: ~N[2018-06-28 19:00:00],
      result: "1-2",
      stadium: stadium_mordovia,
      home_team: team_panama,
      away_team: team_tunisia
    }
    Repo.insert %Goal{
      match_id: match_panama_tunisia.id,
      match_minute: 33,
      method: method_own_goal,
      player: Repo.get_by(Player, name: "Yassine Meryah")
    }
    Repo.insert %Goal{
      match_id: match_panama_tunisia.id,
      match_minute: 50,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Fakhreddine Ben Youssef")
    }
    Repo.insert %Goal{
      match_id: match_panama_tunisia.id,
      match_minute: 66,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Wahbi Khazri")
    }
#                                   GROUP H
    match_colombia_japan = Repo.insert! %Match{
      playtime: ~N[2018-06-19 13:00:00],
      result: "1-2",
      stadium: stadium_mordovia,
      home_team: team_colombia,
      away_team: team_japan
    }
    Repo.insert %Goal{
      match_id: match_colombia_japan.id,
      match_minute: 6,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Shinji Kagawa")
    }
    Repo.insert %Goal{
      match_id: match_colombia_japan.id,
      match_minute: 39,
      method: method_free_kick,
      player: Repo.get_by(Player, name: "Juan Quintero")
    }
    Repo.insert %Goal{
      match_id: match_colombia_japan.id,
      match_minute: 73,
      method: method_header,
      player: Repo.get_by(Player, name: "Yuya Osako")
    }

    match_poland_senegal = Repo.insert! %Match{
      playtime: ~N[2018-06-19 16:00:00],
      result: "1-2",
      stadium: stadium_otkrytie,
      home_team: team_poland,
      away_team: team_senegal
    }
    Repo.insert %Goal{
      match_id: match_poland_senegal.id,
      match_minute: 38,
      method: method_own_goal,
      player: Repo.get_by(Player, name: "Thiago Rangel cionek")
    }
    Repo.insert %Goal{
      match_id: match_poland_senegal.id,
      match_minute: 61,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Mbaye Niang")
    }
    Repo.insert %Goal{
      match_id: match_poland_senegal.id,
      match_minute: 86,
      method: method_header,
      player: Repo.get_by(Player, name: "Grzegorz Krychowiak")
    }

    match_japan_senegal = Repo.insert! %Match{
      playtime: ~N[2018-06-24 16:00:00],
      result: "2-2",
      stadium: stadium_tsentralnyi,
      home_team: team_japan,
      away_team: team_senegal
    }
    Repo.insert %Goal{
      match_id: match_japan_senegal.id,
      match_minute: 11,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Sadio Mane")
    }
    Repo.insert %Goal{
      match_id: match_japan_senegal.id,
      match_minute: 34,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Takashi Inui")
    }
    Repo.insert %Goal{
      match_id: match_japan_senegal.id,
      match_minute: 71,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Moussa Wague")
    }
    Repo.insert %Goal{
      match_id: match_japan_senegal.id,
      match_minute: 78,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Keisuke Honda")
    }

    match_poland_colombia = Repo.insert! %Match{
      playtime: ~N[2018-06-24 19:00:00],
      result: "0-3",
      stadium: stadium_kazan,
      home_team: team_poland,
      away_team: team_colombia
    }
    Repo.insert %Goal{
      match_id: match_poland_colombia.id,
      match_minute: 40,
      method: method_header,
      player: Repo.get_by(Player, name: "Yerry Mina")
    }
    Repo.insert %Goal{
      match_id: match_poland_colombia.id,
      match_minute: 70,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Radamel Falcao")
    }
    Repo.insert %Goal{
      match_id: match_poland_colombia.id,
      match_minute: 75,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Juan Cuadrado")
    }

    match_senegal_colombia = Repo.insert! %Match{
      playtime: ~N[2018-06-28 15:00:00],
      result: "0-1",
      stadium: stadium_cosmos,
      home_team: team_senegal,
      away_team: team_colombia
    }
    Repo.insert %Goal{
      match_id: match_senegal_colombia.id,
      match_minute: 74,
      method: method_header,
      player: Repo.get_by(Player, name: "Yerry Mina")
    }

    match_japan_poland = Repo.insert! %Match{
      playtime: ~N[2018-06-28 15:00:00],
      result: "0-1",
      stadium: stadium_centrlniy,
      home_team: team_japan,
      away_team: team_poland
    }
    Repo.insert %Goal{
      match_id: match_japan_poland.id,
      match_minute: 59,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Jan Bednarek")
    }
#                                 ROUND OF 16
    match_france_argentina = Repo.insert! %Match{
      playtime: ~N[2018-06-30 15:00:00],
      result: "4-3",
      stadium: stadium_kazan,
      home_team: team_france,
      away_team: team_argentina
    }
    Repo.insert %Goal{
      match_id: match_france_argentina.id,
      match_minute: 13,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Antoine Griezmann")
    }
    Repo.insert %Goal{
      match_id: match_france_argentina.id,
      match_minute: 41,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Angel Di maria")
    }
    Repo.insert %Goal{
      match_id: match_france_argentina.id,
      match_minute: 48,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Gabriel Mercado")
    }
    Repo.insert %Goal{
      match_id: match_france_argentina.id,
      match_minute: 57,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Benjamin Pavard")
    }
    Repo.insert %Goal{
      match_id: match_france_argentina.id,
      match_minute: 64,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Kylian Mbappe")
    }
    Repo.insert %Goal{
      match_id: match_france_argentina.id,
      match_minute: 68,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Kylian Mbappe")
    }
    Repo.insert %Goal{
      match_id: match_france_argentina.id,
      match_minute: 90,
      method: method_header,
      player: Repo.get_by(Player, name: "Kun Agueero")
    }

    match_uruguay_portugal = Repo.insert! %Match{
      playtime: ~N[2018-06-30 19:00:00],
      result: "2-1",
      stadium: stadium_olimpiyskiy,
      home_team: team_uruguay,
      away_team: team_portugal
    }
    Repo.insert %Goal{
      match_id: match_uruguay_portugal.id,
      match_minute: 7,
      method: method_header,
      player: Repo.get_by(Player, name: "Edinson Cavani")
    }
    Repo.insert %Goal{
      match_id: match_uruguay_portugal.id,
      match_minute: 65,
      method: method_header,
      player: Repo.get_by(Player, name: "Pepe")
    }
    Repo.insert %Goal{
      match_id: match_uruguay_portugal.id,
      match_minute: 62,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Edinson Cavani")
    }

    match_spain_russia = Repo.insert! %Match{
      playtime: ~N[2018-07-01 15:00:00],
      result: "3-4",
      stadium: stadium_luzhniki,
      home_team: team_spain,
      away_team: team_russia
    }
    Repo.insert %Goal{
      match_id: match_spain_russia.id,
      match_minute: 12,
      method: method_header,
      player: Repo.get_by(Player, name: "Sergey Ignashevich")
    }
    Repo.insert %Goal{
      match_id: match_spain_russia.id,
      match_minute: 41,
      method: method_header,
      player: Repo.get_by(Player, name: "Artem Dzyuba")
    }
    Repo.insert %Goal{
      match_id: match_spain_russia.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Iniesta")
    }
    Repo.insert %Goal{
      match_id: match_spain_russia.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Fedor Smolov")
    }
    Repo.insert %Goal{
      match_id: match_spain_russia.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Sergey Ignashevich")
    }
    Repo.insert %Goal{
      match_id: match_spain_russia.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Aleksandr Golovin")
    }
    Repo.insert %Goal{
      match_id: match_spain_russia.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Sergio Ramos")
    }
    Repo.insert %Goal{
      match_id: match_spain_russia.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Denis Cheryshev")
    }

    match_croatia_denmark = Repo.insert! %Match{
      playtime: ~N[2018-07-01 19:00:00],
      result: "3-2",
      stadium: stadium_nizhny,
      home_team: team_croatia,
      away_team: team_denmark
    }
    Repo.insert %Goal{
      match_id: match_croatia_denmark.id,
      match_minute: 1,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Mathias Joergensen")
    }
    Repo.insert %Goal{
      match_id: match_croatia_denmark.id,
      match_minute: 4,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Mario Mandzukic")
    }
    Repo.insert %Goal{
      match_id: match_croatia_denmark.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Simon Kjaer")
    }
    Repo.insert %Goal{
      match_id: match_croatia_denmark.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Andrej Kramaric")
    }
    Repo.insert %Goal{
      match_id: match_croatia_denmark.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Michael Krohn Dehli")
    }
    Repo.insert %Goal{
      match_id: match_croatia_denmark.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Ivan Rakitic")
    }

    match_brazil_mexico = Repo.insert! %Match{
      playtime: ~N[2018-07-02 15:00:00],
      result: "2-0",
      stadium: stadium_cosmos,
      home_team: team_brazil,
      away_team: team_mexico
    }
    Repo.insert %Goal{
      match_id: match_brazil_mexico.id,
      match_minute: 51,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Neymar")
    }
    Repo.insert %Goal{
      match_id: match_brazil_mexico.id,
      match_minute: 88,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Roberto Firmino")
    }

    match_belgium_japan = Repo.insert! %Match{
      playtime: ~N[2018-07-02 19:00:00],
      result: "3-2",
      stadium: stadium_levberdon,
      home_team: team_belgium,
      away_team: team_japan
    }
    Repo.insert %Goal{
      match_id: match_belgium_japan.id,
      match_minute: 48,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Genki Haraguchi")
    }
    Repo.insert %Goal{
      match_id: match_belgium_japan.id,
      match_minute: 52,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Takashi Inui")
    }
    Repo.insert %Goal{
      match_id: match_belgium_japan.id,
      match_minute: 69,
      method: method_header,
      player: Repo.get_by(Player, name: "Jan Vertonghen")
    }
    Repo.insert %Goal{
      match_id: match_belgium_japan.id,
      match_minute: 74,
      method: method_header,
      player: Repo.get_by(Player, name: "Marouane Fellaini")
    }
    Repo.insert %Goal{
      match_id: match_belgium_japan.id,
      match_minute: 90,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Nacer Chadli")
    }

    match_sweden_switzerland = Repo.insert! %Match{
      playtime: ~N[2018-07-03 15:00:00],
      result: "1-0",
      stadium: stadium_krestovsky,
      home_team: team_sweden,
      away_team: team_switzerland
    }
    Repo.insert %Goal{
      match_id: match_sweden_switzerland.id,
      match_minute: 66,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Emil Forsberg")
    }

    match_colombia_england = Repo.insert! %Match{
      playtime: ~N[2018-07-03 19:00:00],
      result: "3-4",
      stadium: stadium_otkrytie,
      home_team: team_colombia,
      away_team: team_england
    }
    Repo.insert %Goal{
      match_id: match_colombia_england.id,
      match_minute: 57,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Harry Kane")
    }
    Repo.insert %Goal{
      match_id: match_colombia_england.id,
      match_minute: 90,
      method: method_header,
      player: Repo.get_by(Player, name: "Yerry Mina")
    }
    Repo.insert %Goal{
      match_id: match_colombia_england.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Radamel Falcao")
    }
    Repo.insert %Goal{
      match_id: match_colombia_england.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Harry Kane")
    }
    Repo.insert %Goal{
      match_id: match_colombia_england.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Juan Cuadrado")
    }
    Repo.insert %Goal{
      match_id: match_colombia_england.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Marcus Rashford")
    }
    Repo.insert %Goal{
      match_id: match_colombia_england.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Luis Muriel")
    }
    Repo.insert %Goal{
      match_id: match_colombia_england.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Kieran Trippier")
    }
    Repo.insert %Goal{
      match_id: match_colombia_england.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Eric Dier")
    }
#                                QUARTER FINALS
    match_uruguay_france = Repo.insert! %Match{
      playtime: ~N[2018-07-06 15:00:00],
      result: "0-2",
      stadium: stadium_nizhny,
      home_team: team_uruguay,
      away_team: team_france
    }
    Repo.insert %Goal{
      match_id: match_uruguay_france.id,
      match_minute: 40,
      method: method_header,
      player: Repo.get_by(Player, name: "Raphael Varane")
    }
    Repo.insert %Goal{
      match_id: match_uruguay_france.id,
      match_minute: 61,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Antoine Griezmann")
    }

    match_brazil_belgium = Repo.insert! %Match{
      playtime: ~N[2018-07-06 19:00:00],
      result: "1-2",
      stadium: stadium_kazan,
      home_team: team_brazil,
      away_team: team_belgium
    }
    Repo.insert %Goal{
      match_id: match_brazil_belgium.id,
      match_minute: 13,
      method: method_own_goal,
      player: Repo.get_by(Player, name: "Fernandinho")
    }
    Repo.insert %Goal{
      match_id: match_brazil_belgium.id,
      match_minute: 31,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Kevin De bruyne")
    }
    Repo.insert %Goal{
      match_id: match_brazil_belgium.id,
      match_minute: 76,
      method: method_header,
      player: Repo.get_by(Player, name: "Renato Augusto")
    }

    match_sweden_england = Repo.insert! %Match{
      playtime: ~N[2018-07-07 15:00:00],
      result: "0-2",
      stadium: stadium_cosmos,
      home_team: team_sweden,
      away_team: team_england
    }
    Repo.insert %Goal{
      match_id: match_sweden_england.id,
      match_minute: 30,
      method: method_header,
      player: Repo.get_by(Player, name: "Harry Maguire")
    }
    Repo.insert %Goal{
      match_id: match_sweden_england.id,
      match_minute: 59,
      method: method_header,
      player: Repo.get_by(Player, name: "Dele Alli")
    }

    match_russia_croatia = Repo.insert! %Match{
      playtime: ~N[2018-07-07 19:00:00],
      result: "3-4",
      stadium: stadium_olimpiyskiy,
      home_team: team_russia,
      away_team: team_croatia
    }
    Repo.insert %Goal{
      match_id: match_russia_croatia.id,
      match_minute: 31,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Denis Cheryshev")
    }
    Repo.insert %Goal{
      match_id: match_russia_croatia.id,
      match_minute: 40,
      method: method_header,
      player: Repo.get_by(Player, name: "Andrej Kramaric")
    }
    Repo.insert %Goal{
      match_id: match_russia_croatia.id,
      match_minute: 101,
      method: method_header,
      player: Repo.get_by(Player, name: "Domagoj Vida")
    }
    Repo.insert %Goal{
      match_id: match_russia_croatia.id,
      match_minute: 115,
      method: method_header,
      player: Repo.get_by(Player, name: "Mario Fernandes")
    }
    Repo.insert %Goal{
      match_id: match_russia_croatia.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Marcelo Brozovic")
    }
    Repo.insert %Goal{
      match_id: match_russia_croatia.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Alan Dzagoev")
    }
    Repo.insert %Goal{
      match_id: match_russia_croatia.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Luka Modric")
    }
    Repo.insert %Goal{
      match_id: match_russia_croatia.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Sergey Ignashevich")
    }
    Repo.insert %Goal{
      match_id: match_russia_croatia.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Domagoj Vida")
    }
    Repo.insert %Goal{
      match_id: match_russia_croatia.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Daler Kuzyaev")
    }
    Repo.insert %Goal{
      match_id: match_russia_croatia.id,
      match_minute: 120,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Ivan Rakitic")
    }
#                                 SEMI FINALS
    match_france_belgium = Repo.insert! %Match{
      playtime: ~N[2018-07-10 19:00:00],
      result: "1-0",
      stadium: stadium_krestovsky,
      home_team: team_france,
      away_team: team_belgium
    }
    Repo.insert %Goal{
      match_id: match_france_belgium.id,
      match_minute: 51,
      method: method_header,
      player: Repo.get_by(Player, name: "Antoine Griezmann")
    }

    match_croatia_england = Repo.insert! %Match{
      playtime: ~N[2018-07-11 19:00:00],
      result: "2-1",
      stadium: stadium_luzhniki,
      home_team: team_croatia,
      away_team: team_england
    }
    Repo.insert %Goal{
      match_id: match_croatia_england.id,
      match_minute: 5,
      method: method_free_kick,
      player: Repo.get_by(Player, name: "Kieran Trippier")
    }
    Repo.insert %Goal{
      match_id: match_croatia_england.id,
      match_minute: 68,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Ivan Perisic")
    }
    Repo.insert %Goal{
      match_id: match_croatia_england.id,
      match_minute: 109,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Mario Mandzukic")
    }
#                                 THIRD PLACE
    match_belgium_england = Repo.insert! %Match{
      playtime: ~N[2018-07-14 15:00:00],
      result: "2-0",
      stadium: stadium_krestovsky,
      home_team: team_belgium,
      away_team: team_england
    }
    Repo.insert %Goal{
      match_id: match_belgium_england.id,
      match_minute: 4,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Thomas Meunier")
    }
    Repo.insert %Goal{
      match_id: match_belgium_england.id,
      match_minute: 82,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Eden Hazard")
    }
#                                    FINAL
    match_france_croatia = Repo.insert! %Match{
      playtime: ~N[2018-07-15 16:00:00],
      result: "4-2",
      stadium: stadium_luzhniki,
      home_team: team_france,
      away_team: team_croatia
    }
    Repo.insert %Goal{
      match_id: match_france_croatia.id,
      match_minute: 19,
      method: method_own_goal,
      player: Repo.get_by(Player, name: "Mario Mandzukic")
    }
    Repo.insert %Goal{
      match_id: match_france_croatia.id,
      match_minute: 28,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Ivan Perisic")
    }
    Repo.insert %Goal{
      match_id: match_france_croatia.id,
      match_minute: 38,
      method: method_penalty,
      player: Repo.get_by(Player, name: "Antoine Griezmann")
    }
    Repo.insert %Goal{
      match_id: match_france_croatia.id,
      match_minute: 59,
      method: method_left_foot,
      player: Repo.get_by(Player, name: "Paul Pogba")
    }
    Repo.insert %Goal{
      match_id: match_france_croatia.id,
      match_minute: 65,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Kylian Mbappe")
    }
    Repo.insert %Goal{
      match_id: match_france_croatia.id,
      match_minute: 69,
      method: method_right_foot,
      player: Repo.get_by(Player, name: "Mario Mandzukic")
    }
  end
end

Wc2018Graphql.Data.generate
