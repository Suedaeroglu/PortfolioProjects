
# Exploratory Data Analysis in SQL

## Overview

This project is a comprehensive analysis of the COVID-19 pandemic, utilizing MySQL for data exploration and insight generation. The analysis covers various aspects of the pandemic, including infection rates, mortality, vaccination impacts, and global and regional trends. The goal is to understand how the virus spread, which countries were most affected, and the effectiveness of global response efforts, particularly vaccination campaigns.

## Objectives

The main objectives of this project are:

- Examine Death Rates: Calculate death percentages relative to confirmed cases to understand the severity of the virus in different regions.

- Analyze Infection Rates: Determine countries with the highest infection rates and compare these to their population sizes.

- Identify High-Impact Countries: Identify countries with the highest death counts and explore contributing factors.

- Continental Analysis: Break down data by continent to see regional differences in infection, death rates, and vaccination coverage.

- Global Perspective: Assess the overall global numbers, comparing total cases, deaths, and recoveries.

- Vaccination Analysis: Analyze the relationship between population sizes and vaccination rates to evaluate the impact of vaccination campaigns.

- Data Structuring: Use Common Table Expressions (CTEs) and create views to organize data for better accessibility and visualization.

## Data

The dataset used for this analysis is sourced from multiple reputable repositories, including Johns Hopkins University and World Health Organization (WHO). It includes detailed information on:

- Confirmed Cases: Number of confirmed COVID-19 cases reported by country and date.

- Deaths: Number of deaths attributed to COVID-19.

- Recoveries: Number of recoveries from COVID-19.

- Vaccinations: Vaccination data including doses administered and population coverage.

## Tools and Technologies

- MySQL: Primary tool for data storage, manipulation, and analysis.

- Excel: Used for initial data cleaning and preprocessing.

- GitHub: Repository for hosting code and documentation.

## Data Preparation

- Data Cleaning: Addressed missing values and inconsistencies, and standardized formats for analysis.

- Data Transformation: Aggregated and normalized data to create meaningful metrics for analysis, such as infection rates per 100,000 people.

- Data Loading: Imported the cleaned dataset into MySQL for structured analysis.

## Key Analyses

Death Percentage Analysis: Calculated the death percentage as the ratio of deaths to confirmed cases to highlight the severity of outbreaks in different countries.

- SQL Techniques: Utilized aggregate functions to compute death percentages, filtered results to focus on countries with significant data, and used subqueries for deeper insights.

Infection vs. Population Analysis: Compared the total number of cases against the population to identify countries with the highest infection rates relative to their population sizes.

- SQL Techniques: Employed joins between COVID-19 data and population data to calculate per capita infection rates.

Countries with Highest Infection and Death Counts: Identified countries with the most severe outbreaks by total cases and deaths, analyzing contributing factors such as healthcare quality and government responses.

- SQL Techniques: Used ranking functions and filters to isolate countries with the highest counts, and performed time-series analysis to track outbreak progression.

Continental Breakdown: Analyzed data by continent to understand regional differences in terms of infection rates, death rates, and vaccination effectiveness.

- SQL Techniques: Aggregated data by continent using GROUP BY clauses and calculated regional averages and totals.

Global Overview: Provided a global summary of COVID-19’s impact, including total cases, deaths, recoveries, and vaccinations.

- SQL Techniques: Used UNION ALL to combine data across multiple sources and created summary tables for global reporting.

Population vs. Vaccination Analysis: Explored the correlation between a country’s population size and its vaccination coverage, identifying trends and gaps in vaccination efforts.

- SQL Techniques: Created calculated fields to express vaccination rates as a percentage of the population and used window functions to assess trends over time.

Use of CTEs and Views: Organized complex queries using Common Table Expressions (CTEs) for readability and reusability, and created views to store results for further analysis and visualization.

- SQL Techniques: Implemented CTEs for temporary data storage during query execution and views to save frequently accessed data subsets.

## Project Structure

- SQL Scripts: Contains all SQL scripts used for data exploration and analysis.

- Data: Includes raw and cleaned datasets, along with data source documentation.

## How to Run the Project

- Clone this repository:
  
https://github.com/Suedaeroglu/PortfolioProjects

- Set up MySQL:
Install MySQL and create a new database for the project.

Import the dataset using the provided SQL scripts.

- Execute SQL Scripts:
Run the scripts in the SQL Scripts folder to perform data analysis.


## Key Findings

- High Infection Rates: Several countries exhibited high infection rates relative to their populations, often due to dense urban populations or delayed government interventions.

- Mortality Insights: Higher death percentages correlated with countries that have older populations or strained healthcare systems.

- Vaccination Impact: Countries with higher vaccination rates showed a significant reduction in severe cases and deaths, underscoring the effectiveness of vaccination campaigns.

- Regional Differences: Analysis by continent revealed significant disparities in infection and death rates, influenced by factors such as healthcare infrastructure and government policies.

## Conclusion

This project provides valuable insights into the COVID-19 pandemic, demonstrating the power of SQL in handling complex data analysis tasks. By breaking down data into meaningful insights, we gain a better understanding of the pandemic's impact globally and regionally, as well as the effectiveness of various public health measures. This analysis is a key component of my data analyst portfolio, showcasing my ability to analyze large datasets and derive actionable insights.

