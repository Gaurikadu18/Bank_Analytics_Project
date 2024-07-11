create database bank_loan_project;
use bank_loan_project;
SELECT * from finance_1;
select * from finance_2;
/*
> Year wise loan amount
> Grade-Subgrade wise revolution balance
> Total Payment For Verified Status Vs Non Verified Status
> State Wise Last credit pull _d Wise Loan Status
> Home Ownership Vs Last Payment Date Stats. 

*/


# KPI 1 
select year(issue_D) as Year_of_issue_d ,
concat("$", format(round(sum(loan_amnt)/1000000,2),2),"M") as Total_loan_amnt
from finance_1
group by Year_of_issue_d
order by Year_of_issue_d;


# KPI 2

select 
grade ,sub_grade ,
concat("$", format(round(sum(revol_bal)/1000000,2),2),"M") as total_revol_bal
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by grade ,sub_grade
order by grade ,sub_grade ;


# KPI 3

select verification_status ,
concat("$", format(round(sum(total_pymnt)/1000000,2),2),"M") as total_payment
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by verification_status ;



select * from finance_1;
select * from finance_2;

# KPI 4

select addr_state , last_Credit_pull_D , loan_Status

from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)

group by addr_state ,last_Credit_pull_d , loan_status
order by last_credit_pull_d ;


#KPI 5

select home_ownership,
last_pymnt_d,
CONCAT (FORMAT(ROUND(SUM(last_pymnt_amnt) / 10000, 2), 2), "K") AS total_amount
FROM 
finance_1
INNER JOIN 
 finance_2 ON finance_1.id = finance_2.id
 GROUP BY 
 home_ownership, last_pymnt_d
 ORDER BY
  last_pymnt_d DESC ,home_ownership DESC;
