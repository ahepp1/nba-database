-- Alex Hepp, Nico Ivanov
-- ahepp1, nivanov4

-- Insert a new year into award
insert into Award 
value
('2021/2022', 'Alex Hepp', 'Nico Ivanov', 'Me', 'You', 'no one :(', 'Also Nico!');


-- Add a new players for a season
insert into Demographic
values
('Alex Hepp', '2021', 'C', '99', '99', '2020-01-01'),
('Nico Ivanov', '2001', 'G', '99', '99', '2020-01-01');

-- Add a new team to the league
insert into Team
value
('2021/2022', 'AAA', 'Awesome Atlantic Albatrosses', 82, 0, 15, 100, 100, 100, 'me', 'east', 1);


-- Add a new season for some players
insert into Stat
values
('2021/2022', 'Alex Hepp', 'AAA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2001/2002', 'Nico Ivanov', 'BOS', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
('2021/2022', 'Larry Bird', 'AAA', 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);

-- Gotta get a coach for the new team!
insert into Coach
value
('2021/2022', 'AAA', 'Bob Ross');


-- remove all entries from the Celtics and from the year 1975 from all entities
delete from Stat
where team = 'BOS' or season = '1975/1976';

delete from Coach
where team = 'BOS' or season = '1975/1976';

delete from Team
where team = 'BOS' or season = '1975/1976';

delete from Award
where season = '1975/1976';

-- Remove a player from Stats and Demographics
delete from Stat
where name = 'LeBron James';

delete from Demographic
where name = 'LeBron James';


