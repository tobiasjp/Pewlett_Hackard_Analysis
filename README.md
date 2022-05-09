# Pewlett-Hackard Analysis

## Overview

Pewlett-Hackard is a technology company that is facing a large exodus of employees due to the number of employees reaching retirement age.  In order to plan for this 'silver tsunami' which will leave thousands of jobs vacant, Pewlett-Hackard executives have asked for an analysis of all of employees that will soon reach retirement age in order to start planning for Pewlett-Hackard's future.  Executives will need to determine which positions in which departments need to be filled.  Secondly, executives would like to develop a mentorship program that will fill the gap between the experienced skill sets of retirement-ready employees and next generation of Pewlett-Hackard employees. 

## Resources

### Software
  - PostgreSQL/ pgAdmin 4
  - Visual Studio Code

### Data
Database: 
  - PH-EmployeesDB

Tables:
  - departments
  - dept_emp
  - employees
  - dept_manager  
  - salaries
  - titles


## Analysis and Results

### Retirement Titles
The first query of the database narrowed down employees born between 1952 and 1955, as this is the most likely group of individuals nearing retirement. The results of this query produced a significant number of employees:

  - The query returned over 130,000 results for employees that will be retiring.  
  
  - Upon inspecting the data from this query, many of the results were duplicated employees that have received title changes throughout their employment and employees that may no longer be employed.
  
  - This data is not specific enough to make a determination for all positions that will need to be filled, but is a good start to determine the number of employees that may fit the retirement criteria.
  
![retirement_titles]('Resources/retirement_titles.png')

### Unique Titles
In order to narrow down the number of employees to their current job, in our second query we applied a filter to only return distinct records for employees in their current positions, as opposed to a history of all employment records present in the first query.  

  - The query returned over 72,000 results, meaning there will be potentially 72,000+ job vacancies to fill within the near future.
  
  - The results also suggest large areas of the business will need immediate replacements, as many of these positions likely are an important part of company success.

![unique titles]('Resources/unique_titles.png')

### Retiring Titles
In our third query, we needed to determine the job titles with the largest number of positions that will need to be filled.

  - Engineering will have the most significant number of job vacancies with 35,000+ job openings when Senior Engineer, Engineer, and Assistant Engineer job title results are combined.
  
  - Company Staff positions will also see a significant number of openings with 32,000+ potenial job vacancies when Senior Staff and non-titled Staff are combined.
  
  - Managers will experience the least amount of job openings with only two records showing for potential job vacancies.

![retiring titles]('Resources/retiring_titles.png')

### Employee Mentorship Program
In order to develop a potential list of employees that will be retiring and potentially interested in a participating in a company mentorship program, we filtered our data to just indivudals born in the year 1955.  This has the potential to help the company bridge the gap between the large skill set leaving the company and the new individuals that will need to fill those skill sets.

  - The results of the query determined 1,549 employees met the criteria for potential employees that could participate in the mentorship program.
  
  - Considering the large number of employee vacancies that will need to be filled, it would be useful to expand the criteria for participants and group together indivuduals with similar job titles to cover a larger range of mentoring.


![employee mentorship]('Resources/mentorship.png')


## Summary 

Based on an analysis of retiring employees:

  - 72,458 vacancies will need to be filled in total.
  
    - Engineering will experience the largest vacancy with 36,291 positions between Senior Engineers, non-titled Engineers, and Assistant Engineers.
    
    - Staff positions will experience a significant vacancy with 32,562 positions between Senior staff and non-titled Staff.

Based on an analysis of potential candidates for a Mentorship program:

  - 1,549 employees meet the criteria for employees that could participate in the program.
  
  - This program would not offer enough retirement-ready employees to mentor the next generation of Pewlett-Hackard employees.
  
    - The criteria for participation would need to be expanded to include more individuals in a larger range of employees, for example employees born between 1955-1960.
    
    - The program could also look at the potential successes and opportunities of placing mentors with groups of mentees with similar job titles and functions.
