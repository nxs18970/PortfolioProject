--Select * from Portfolioproject..CovidDeaths$ order by 3,4;
--Select * from Portfolioproject..CovidVaccinations$ order by 3,4;


--Select location,date, total_cases, new_cases, total_deaths,population
--from Portfolioproject..CovidDeaths$ order by 1,2;


--select  location, total_cases,total_deaths, (total_cases/total_deaths) as perc
--from Portfolioproject..CovidDeaths$ where location = 'India';


--select  location, count(total_cases),count(total_deaths) 
--from Portfolioproject..CovidDeaths$  where total_deaths>=1 AND total_cases >=1 group by location order by location;

--select  location, total_cases, population, round((total_cases/population)*100,4) as pec  
--from Portfolioproject..CovidDeaths$  where total_deaths>=1 AND total_cases >=1;

--  select  location, total_cases, population, round((total_cases/population)*100,4) as pec  
--from Portfolioproject..CovidDeaths$  where total_deaths>=1 AND total_cases >=1 ;


--select  location, population, max(total_cases), Max(total_cases/population)*100 as percentagepopulationinfected 
--from Portfolioproject..CovidDeaths$ group by location, population  order by percentagepopulationinfected desc;

--select  location, max(cast(total_deaths as bigint)) as Totaldeaths
--from Portfolioproject..CovidDeaths$ 
-- where continent is not null 
--group by location, population
--order by Totaldeaths Desc;

--select  location, max(cast(total_deaths as bigint)) as Totaldeaths
--from Portfolioproject..CovidDeaths$ 
--where continent is null 
--group by location
--order by Totaldeaths Desc;

--select  continent,max(total_cases)
--from Portfolioproject..CovidDeaths$ 
--where continent is not null		
--group by continent
--;

select  date, sum(cast (new_cases as bigint)) as NewCases, sum(cast(new_deaths as bigint)) as NewDeaths
from Portfolioproject..CovidDeaths$
where continent is not null
group by date 
order by date;