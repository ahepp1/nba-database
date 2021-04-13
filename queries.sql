-- Alex Hepp, Nico Ivanov
-- ahepp1, nivanov4


-- 1
-- Find each team's average number of points in the 2018/2019 season (all teams have 82 games).

select team, sum(pts) / 82 as PPG
from Stat
where season = '2018/2019'
group by team;


-- 2
-- How many points did the average player score on each team?

select team, avg(pts) as avg_points
from Stat
where season = '2018/2019'
group by team;


-- 3
-- What is the mean height of the players on each team with the most defensive rebounds in the 2000/2001 season?

select avg(D.height) as mean_height
from Stat as S, Demographic as D
where S.name = D.name and S.season = '2000/2001' and (DRB + ORB) = (
        select max(DRB + ORB) 
        from Stat as S2
        where season='2000/2001' and S.team = S2.team);

-- 4
-- Who is the shortest player ever to lead the league in points in a season?

select S.season, S.team, D.name, D.height, PTS
from Stat as S, Demographic as D
where S.name = D.name and PTS = (
        select max(PTS) 
        from Stat as S2 
        where S.season = S2.season)
group by season
order by D.height
limit 1;


-- 5
-- Which 5 players has the highest three point shooting percentage in the 2015-2016 season (with over 50 attempts)?

select name, 3P, 3PA, (3P / 3PA) as percent
from Stat
where season = '2015/2016' and 3PA > 50
order by percent desc
limit 5;

-- 6
-- What was the average number of three pointers attempted per player (per season) in 1994 vs 2019?

select season, avg(3PA) as avg_3PA
from Stat
where (season = '1994/1995' or season = '2018/2019')
group by season;

-- 7
-- Which player has won MVP award the most times? How tall was he?

select mvp, count(mvp) as num_mvp, height
from Award as A, Demographic as D
where A.mvp = D.name
group by mvp
order by num_mvp desc
limit 1;

-- 8
-- How many playoff seasons does each team have? How does this compare to average team SRS over all seasons?

select team, count(playoffs) as num_playoffs, round(avg(SRS), 2) as avg_SRS
from Team
where playoffs = 1
group by team
order by num_playoffs desc;

-- 9
-- How many career wins does LaBron have? 

select S.name, sum(T.W) as total_wins
from Stat as S, Team as T
where T.season = S.season and T.team = S.team and S.name = 'LeBron James';


-- 10
-- What is the average BMI of players by year born? (using formuala (weight / height^2) * 703 for standard units) 

select avg(weight / (height * height) * 703) as BMI, year(birth_date) as birth_year
from Demographic
group by birth_year;



-- 11
-- Which position wins sixth man of the year most often?

select D.player_position, count(D.player_position) as number_of_awards
from Award as A, Demographic as D
where A.sixth_man = D.Name
group by player_position
order by number_of_awards desc
limit 1;

-- 12
-- Who was the head coach of the team with the most number of points in the 1969-1970 season? 

select coach_name, C.team, sum(PTS) as total_points
from Coach as C, Stat as S
where C.team = S.team and C.season = S.season and C.season = '1969/1970'
group by coach_name
order by total_points
limit 1;

-- 13
-- Has a player ever been mvp and rookie of the year in the same year? How many assists and points did they have that season?

select A.season, A.mvp, S.AST, S.PTS
from Award as A, Stat as S 
where A.season = S.season and mvp = rookie_of_the_year and S.name = A.mvp;

-- 14
-- Who is the shortest player ever to lead their team in points in a season?

select season, team, D.name, height, PTS
from Demographic as D, Stat as S
where D.name = S.name and PTS = 
        (select max(PTS) 
        from Stat as S2 
        where S.team = S2.team and S.season = S2.season)
group by team, season
order by height
limit 1;

-- 15
-- Who was the coach of the team with the most assists in the 1982/1983 season?

select coach_name, S.team, sum(AST) as total_AST
from Coach as C, Stat as S
where C.team = S.team and S.season = '1982/1983' and S.season = C.season
group by coach_name
order by total_AST desc
limit 1;

