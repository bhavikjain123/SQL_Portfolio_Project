SELECT *
FROM PortfolioProjeect..CovidDeaths
ORDER BY 3,4

--SELECT *
--FROM PortfolioProjeect..CovidVaccinations

-- Select data which we are going to use

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProjeect..CovidDeaths
ORDER BY 1,2


-- looking at Total cases vs Total deaths
-- shows the liklihood of dying if get covid in your country

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as deathPercentagre
FROM PortfolioProjeect..CovidDeaths
WHERE location like '%india%'
ORDER BY 1,2


-- total cases vs population

SELECT location, date,population, total_cases,  (total_cases/population)*100 as casePercentagre
FROM PortfolioProjeect..CovidDeaths
--WHERE location like '%india%'
ORDER BY 1,2


-- looking at countries with highest infection rate compare to population
SELECT location, population, MAX(total_cases) as HighestInfectionCount, MAX(total_cases/population)*100 as casePercentage
FROM PortfolioProjeect..CovidDeaths
--WHERE location like '%india%'
GROUP BY location, population
ORDER BY casePercentage desc


-- countries with highest death count per population

SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProjeect..CovidDeaths
--WHERE location like '%india%'
WHERE continent is NOT NULL
GROUP BY location
ORDER BY TotalDeathCount desc


-- LET'S BREAK THINGS BY CONTINENT

-- showing the continent eith the highest death count

SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM PortfolioProjeect..CovidDeaths
--WHERE location like '%india%'
WHERE continent is NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount desc


-- GLOBAL NUMBERS

SELECT date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths,SUM(cast(new_deaths as int))/
SUM(new_cases)*100 as DeathPercentage

FROM PortfolioProjeect..CovidDeaths
WHERE continent is NOT NULL
GROUP BY date
order by 1,2

SELECT  SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths,SUM(cast(new_deaths as int))/
SUM(new_cases)*100 as DeathPercentage

FROM PortfolioProjeect..CovidDeaths
WHERE continent is NOT NULL
--GROUP BY date
order by 1,2


SELECT *
FROM PortfolioProjeect..CovidDeaths as dea
  JOIN PortfolioProjeect..CovidVaccinations as vac
  ON dea.location = vac.location
  and dea.date = vac.date

  -- looking at Total population vs Vaccinations

  SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
  SUM(CONVERT(int,vac.new_vaccinations)) OVER (PARTITION by dea.Location order by dea.location, dea.date) as PeopleVaccinatedOnCountry
FROM PortfolioProjeect..CovidDeaths as dea
  JOIN PortfolioProjeect..CovidVaccinations as vac
  ON dea.location = vac.location
  and dea.date = vac.date
 WHERE dea.continent is NOT NULL
 --order by 1,2

 -- using CTE( to get percentage of total PeopleVaccinatedOnCountry vs Population)


 WITH PopvsVac( continent, location, date, population, new_vaccinations, PeopleVaccinatedOnCountry) as --dono me same columns hone chahie
(
 SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
  SUM(CONVERT(int,vac.new_vaccinations)) OVER (PARTITION by dea.Location order by dea.location, dea.date) as PeopleVaccinatedOnCountry
FROM PortfolioProjeect..CovidDeaths as dea
  JOIN PortfolioProjeect..CovidVaccinations as vac
  ON dea.location = vac.location
  and dea.date = vac.date
 WHERE dea.continent is NOT NULL
)
SELECT * , (PeopleVaccinatedOnCountry/population)*100
From PopvsVac

-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
PeopleVaccinatedOnCountry numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as PeopleVaccinatedOnCountry
--, (RollingPeopleVaccinated/population)*100
From PortfolioProjeect..CovidDeaths dea
Join PortfolioProjeect..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3

Select *, (PeopleVaccinatedOnCountry/Population)*100
From #PercentPopulationVaccinated


-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinatedtwo as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as PeopleVaccinatedOnCountry
--, (RollingPeopleVaccinated/population)*100
From PortfolioProjeect..CovidDeaths dea
Join PortfolioProjeect..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 

Select *
From PercentPopulationVaccinatedtwo

