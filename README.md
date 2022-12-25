# Pewlett-Hackard-Analysis

## Overview

I was given the task of identifying the number of retiring employees by title and determining which employees are eligible for a mentorship program at Pewlett Hackard. The mentorship program aims to retain retirement-aged employees on a part-time basis to mentor junior employees. To complete this analysis, I utilized SQL queries to create tables, import data from CSVs into tables, manipulate tables with joins and functions, and export data into CSVs.

## Results 
Through my analysis, I discovered the following key insights:

   1. I created a list of employees who are eligible for retirement by title. However, the list included many duplicate entries due to promotions and new tours of duty within the company, so I had to manipulate the data to make it clearer.

   2. I then removed duplicate entries to produce an accurate list. The "unique_titles" CSV shows the correct sum and respective titles for the retiring employees. There are 74,458 employees set to retire!

   3. With such a large number of employees retiring, I needed to get an accurate count for each department. 

## Summary

The goal of this analysis was to determine the number of retiring employees by title and identify employees who are eligible to participate in a mentorship program at Pewlett Hackard. The mentorship program aims to retain retirement-aged employees on a part-time basis to mentor junior employees. To complete this analysis, I utilized SQL queries to create tables, import data from CSVs into tables, manipulate tables with joins and functions, and export data into CSVs.

First, I created a list of employees who are eligible for retirement by title. However, the list included many duplicate entries due to promotions and new tours of duty within the company, so I had to manipulate the data to make it clearer.

I then removed duplicate entries to produce an accurate list. The "unique_titles" CSV shows the correct sum and respective titles for the retiring employees. There are 74,458 employees set to retire!

I needed to get an accurate count for each department, so I created the "retiring_titles" table. This table shows that 25,916 employees from Senior Engineering, 24,926 from Senior Staff, 9,285 from Engineer, 7,636 from Staff, 3,603 from Technique Leader, 1,090 from Assistant Engineer, and 2 from Manager are set to retire.

To identify a list of employees eligible to participate in the mentorship program, I joined three tables: employees, department_employees, and titles. I selected only the employees with birth dates between 1-1-1965 and 12-31-1965. I also only pulled employees who were currently employeed. The "mentorship_eligibility" CSV contains a list of every employee suited for the mentorship program.

I also wanted to analyze the number of employees who may be well suited for mentorship by senior employees. I determined that employees who have been in their current position for three years or less would be a good pool of candidates who could benefit from mentoring. To identify these employees, I created a view table and a query to return them in a table, ordered by "from_date" in descending order.