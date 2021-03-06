-- Alex Hepp, Nico Ivanov
-- ahepp1, nivanov4
-- Creation

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
topWS varchar(30),
conference varchar(10),
playoffs int,
primary key (season, team),
foreign key (season) references Award(season));

create table Demographic
(name varchar(30),
rookie_year year,
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
foreign key (season) references Award(season));

create table Coach
(season varchar(15),
team varchar(5),
coach_name varchar(30),
primary key (season, team),
foreign key (season, team) references Team(season, team));

-- Loading

LOAD DATA LOCAL INFILE '/Users/alexanderhepp/Documents/Databases/Project/nba-database/smalls/awards_small.csv'
INTO TABLE Award
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE '/Users/alexanderhepp/Documents/Databases/Project/nba-database/smalls/team_stats_small.csv'
INTO TABLE Team
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/alexanderhepp/Documents/Databases/Project/nba-database/smalls/player_demographics_small.csv'
INTO TABLE Demographic
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/alexanderhepp/Documents/Databases/Project/nba-database/smalls/player_stats_small.csv'
INTO TABLE Stat
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/alexanderhepp/Documents/Databases/Project/nba-database/smalls/coaches_small.csv'
INTO TABLE Coach
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
