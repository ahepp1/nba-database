create table Award
(season varchar(15),
mvp varchar(30),
defensive_player varchar(30),
rookie_of_the_year varchar(30),
sixth_man varchar(30),
most_improved varchar(30),
sportsmanship varchar(30),
primary key (season));


create table Team
(season varchar(15),
team varchar(5),
team_name varchar(30),
W int,
L int,
SRS float,
pace float,
ortg float,
drtg float,
conference varchar(5),
playoffs int,
primary key (season, team),
foreign key (season) references Award(season));


create table Demographic
(name varchar(30),
rookie_year int,
player_position varchar(5),
height int,
weight int,
birth_date date,
primary key (name));

create table Stat
(season varchar(15),
name varchar(30),
team varchar(5),
G int,
MP int,
FG int,
FGA int,
3P int,
3PA int,
FT int,
FTA int,
ORB int,
DRB int,
AST int,
STL int,
BLK int,
TOV int,
PTS int,
primary key (season, name),
foreign key (name) references Demographic(name),
foreign key (season) references Award(season)
foreign key (team) references Team(team));

create table Coach
();