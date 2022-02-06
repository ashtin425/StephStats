-- checking to see if table is functioning correctly

Select *
From UpdatedSteph..RevisedStats

-- Getting AVG 3P% for October  
Select Season_year, AVG([3P%]) as AverageInOct
from UpdatedSteph..RevisedStats
where Date = 'Oct'
group by Season_year

-- Getting AVG 3P% for November  
Select Season_year, AVG([3P%]) as AverageInNov
from UpdatedSteph..RevisedStats
where Date = 'Nov'
group by Season_year

-- Getting AVG 3P% for December  
Select Season_year, AVG([3P%]) as AverageInDec
from UpdatedSteph..RevisedStats
where Date = 'Dec'
group by Season_year

-- Getting AVG 3P% for January  
Select Season_year, AVG([3P%]) as AverageInJan
from UpdatedSteph..RevisedStats
where Date = 'Jan'
group by Season_year

-- Getting AVG 3P% for February  
Select Season_year, AVG([3P%]) as AverageInFeb
from UpdatedSteph..RevisedStats
where Date = 'Feb'
group by Season_year

-- Getting AVG 3P% for March 
Select Season_year, AVG([3P%]) as AverageInMar
from UpdatedSteph..RevisedStats
where Date = 'Mar'
group by Season_year

-- Getting AVG 3P% for April 
Select Season_year, AVG([3P%]) as AverageInApr
from UpdatedSteph..RevisedStats
where Date = 'Apr'
group by Season_year

-- Getting career AVG for each month (May is included due to pandemic year where season started late)
Select Date, AVG([3P%]) as Average
from UpdatedSteph..RevisedStats
group by date
order by case when date = 'Oct' then 1
			  when date = 'Nov' then 2
			  when date = 'Dec' then 3
			  when date = 'Jan' then 4
			  when date = 'Feb' then 5
			  when date = 'Mar' then 6
			  when date = 'Apr' then 7
			  when date = 'May' then 8
			  else 'null'
			end

-- creating new table to hold stephs current season stats
create table current_season (
	Season_year nvarchar(255),
	AverageInJan float,
	AverageInFeb float
)

-- inserting values into current_season table
INSERT INTO current_season
VALUES ('2021-2022', '32.9', '0') -- the february average is at 0 because February games havent been played yet

-- looking at current_season
select *
from current_season

-- Joining Steph's January and February Averages into a table from tables imported from excel using 
-- SQL data and then using union to combine with current_season stats

select January.Season_year, AverageInJan, AverageInFeb
from UpdatedSteph.dbo.January
Join UpdatedSteph.dbo.February
	on January.Season_year = February.Season_year
union 
select *
from current_season





