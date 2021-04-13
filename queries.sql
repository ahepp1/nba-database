-- 1
-- Find each team's average number of points in the 2018/2019 season (all teams have 82 games).

select team, sum(pts) / 82
from Stat
where season = '2018/2019'
group by team;


-- 2
-- How many points did the average player score on each team? 

select team, avg(pts)
from Stat
where season = '2018/2019'
group by team;


-- 3
-- What is the mean height of the player on each team with the most defensive rebounds in the 2000/2001 season?
-- might have to fix duplicated

select S.team, D.name, D.height, DRB
from Stat as S, Demographic as D
where S.name = D.name and S.season = '2000/2001' and DRB = (
        select max(DRB) 
        from Stat as S2
        where season='2000/2001' and S.team = S2.team);
group by team;

-- 4
-- Who is the shortest player to lead the league in points in a season? (give season, team, player, height, and points)

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
-- Which 5 palyers has the highest three point shooting percentage in the 2004-2005 season (with over 50 attempts)?

select season, team, name, 3P, 3PA, 3P / 3PA as percent
from Stat
where season = '2004/2005' and 3PA > 50
order by percent desc
limit 5;

-- 6
-- What was the average number of three pointers attempted per player in 1994 vs 2019?

select season, avg(3PA) as avg_3PA
from Stat
where (season = '1994/1995' or season = '2018/2019')
group by season;

-- 7
-- Which player has won MVP award the most times? How tall was he?

select mvp, count(mvp) as c, height
from Award as A, Demographic as D
where A.mvp = D.name
group by mvp
order by c desc
limit 1;

-- 8
-- 



-- 9
--



-- 10
--



-- 11
--



-- 12
--



-- 13
--



-- 14
--



-- 15
--


