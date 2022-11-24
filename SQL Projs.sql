use indcvd;
Select Location , population , date , new_deaths , total_deaths from incod;

-- Death Percentage --
Select Location , population , date , total_cases , total_deaths ,
 (total_deaths/total_cases) * 100 as Dea_per from incod ;
 
-- Case Percentage --

Select Location , population , date , total_cases , total_deaths ,
(total_cases/population) * 100 as case_per from incod;

-- Highly Infected day --

Select Location , population , date , total_cases , new_cases
from incod order by new_cases desc;

-- High death rates perday --

Select Location , population , date , total_cases , new_deaths
from incod order by new_deaths desc;

-- percent of people vaccinated --

Select Location , population , date , people_vaccinated , 
(People_vaccinated/population) * 100 as vac_per from incod;

-- percent of people fully vaccinated --

Select Location , population , date , people_fully_vaccinated , 
(People_fully_vaccinated/population) * 100 as vac_per from incod;

-- No of peole who have not died after affected by covid --

Select Location , population , date , total_deaths , total_cases,
(total_cases - total_deaths) as survivors 
from incod order by survivors desc;

-- Survivors and death percentage --

Select Location , population , date , total_cases,  
(total_cases - total_deaths) as survivors ,
((total_cases - total_deaths) / total_cases)  * 100  as surv_per,
total_deaths, ((total_deaths) / total_cases)  * 100  as Dea_per,
people_fully_vaccinated , 
(People_fully_vaccinated/population) * 100 as vac_per   
from incod order by survivors;

-- Creating View --

create view  covid_cal as
Select Location , population , date , total_cases,  
(total_cases - total_deaths) as survivors ,
((total_cases - total_deaths) / total_cases)  * 100  as surv_per,
total_deaths, ((total_deaths) / total_cases)  * 100  as Dea_per,
people_fully_vaccinated , 
(People_fully_vaccinated/population) * 100 as vac_per   
from incod order by survivors;


