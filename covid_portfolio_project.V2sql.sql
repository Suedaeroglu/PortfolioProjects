SELECT*
FROM PortfolioProject.CovidDeaths
WHERE TRIM(continent) != ''
order by 3,4 ;

SELECT*
FROM PortfolioProject.covidvaccinations
order by 3,4;

# Looking at Death Percentage

SELECT Location, Date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM PortfolioProject.CovidDeaths
WHERE location like '%states%' and TRIM(continent) != ''
ORDER BY STR_TO_DATE(date, '%m-%d-%Y'),Location, Total_cases;

# Looking at Total Cases vs Population

SELECT Location, Date, Population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
FROM PortfolioProject.CovidDeaths
-- WHERE location like '%states%' and TRIM(continent) != ''
ORDER BY STR_TO_DATE(date, '%m-%d-%Y'),Location, total_cases;

# Looking at Countries with the Highest infection

SELECT Location, Population, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as PercentPopulationInfected
FROM PortfolioProject.CovidDeaths
-- WHERE location like '%states%' and TRIM(continent) != ''
GROUP BY Location, Population
ORDER BY PercentPopulationInfected desc;

# Looking at Countries With Highest Death Count

SELECT Location, MAX(convert(Total_deaths, UNSIGNED)) as TotalDeathCount
FROM PortfolioProject.CovidDeaths
-- where location like '%states%'
WHERE TRIM(continent) != ''
GROUP BY Location 
ORDER BY TotalDeathCount desc;

# Breaking Data Down By Continent

SELECT Continent, MAX(convert(Total_deaths, UNSIGNED)) as TotalDeathCount
FROM PortfolioProject.CovidDeaths
-- where location like '%states%'
WHERE TRIM(continent) != ''
GROUP BY continent
ORDER BY TotalDeathCount desc;

# Looking at the Global Numbers

SELECT SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
FROM PortfolioProject.CovidDeaths
-- WHERE location like '%states%' 
WHERE TRIM(continent) != ''
-- GROUP BY Date
ORDER BY 1,2;

# Looking at Total Population vs Vaccinations


SELECT dea.continent, dea.location, 
STR_TO_DATE(dea.date, '%d/%m/%Y') AS formatted_date, dea.population, vac.new_vaccinations, SUM(Cast(vac.new_vaccinations as UNSIGNED)) OVER (Partition by dea.Location Order By dea.Location, dea.Date) as RollingPeopleVaccinated
FROM PortfolioProject.coviddeaths dea
JOIN PortfolioProject.covidvaccinations vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY dea.location, formatted_date;

# USE CTE

WITH PopvsVac (Continent, Location, formatted_date, Population, new_Vaccinations, RollingPeopleVaccinated) AS
(
SELECT dea.continent, dea.location, 
STR_TO_DATE(dea.date, '%d/%m/%Y') AS formatted_date, 
dea.population, 
vac.new_vaccinations, 
SUM(CAST(vac.new_vaccinations AS UNSIGNED)) 
OVER (PARTITION BY dea.Location ORDER BY STR_TO_DATE(dea.date, '%d/%m/%Y')) AS RollingPeopleVaccinated
FROM PortfolioProject.coviddeaths dea
JOIN PortfolioProject.covidvaccinations vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
)
SELECT *, (RollingPeopleVaccinated / Population) * 100 AS VaccinationRate
FROM PopvsVac
ORDER BY Location, formatted_date;

# Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as 
SELECT dea.continent, dea.location, 
STR_TO_DATE(dea.date, '%d/%m/%Y') AS formatted_date, dea.population, vac.new_vaccinations, 
SUM(CAST(vac.new_vaccinations AS UNSIGNED)) OVER (PARTITION BY dea.Location ORDER BY STR_TO_DATE(dea.date, '%d/%m/%Y')) AS RollingPeopleVaccinated
FROM PortfolioProject.coviddeaths dea
JOIN PortfolioProject.covidvaccinations vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent IS NOT NULL;
    
SELECT *
FROM PercentPopulationVaccinated













