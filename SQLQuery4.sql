--select * 
--from Portfolioproject..CovidDeaths$ as dea
--join Portfolioproject..CovidVaccinations$ as vac
-- on dea.location= vac.location and 
--    dea.date= vac.date;


select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations
from Portfolioproject..CovidDeaths$ as dea
join Portfolioproject..CovidVaccinations$ as vac
 on dea.location= vac.location and 
    dea.date= vac.date
where dea.continent is not null and vac.new_vaccinations is not null
order by vac.new_vaccinations ;
