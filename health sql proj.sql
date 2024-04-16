With data as(
SELECT 
Gender,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obs_score

FROM healthdata.ocd_patient_dataset
Group by 1
Order by 2
)
select 
     sum(case when Gender = 'Female' then patient_count else 0 end) as count_female,
     sum(case when Gender = 'Male' then patient_count else 0 end) as count_male,
     round(sum(case when Gender = 'Female' then patient_count else 0 end)/
     (sum(case when Gender = 'Female' then patient_count else 0 end)+sum(case when Gender = 'Male' then patient_count else 0 end)) *100,2) as pct_female,
     
     round(sum(case when Gender = 'Male' then patient_count else 0 end)/
	(sum(case when Gender = 'Female' then patient_count else 0 end)+sum(case when Gender = 'Male' then patient_count else 0 end)) *100,2)
	 as pct_male from data;
     
     select
	Ethnicity,
	count(`Patient ID`) as patient_count,
	avg(`Y-BOCS Score (Obsessions)`) as obs_score
From healthdata.ocd_patient_dataset
Group by 1
Order by 2;

-- alter table healthdata.ocd_patient_dataset
-- modify `OCD Diagnosis Date` date;
select
date_format(`OCD Diagnosis Date`, '%Y-%m-01 00:00:00') as month,
count(`Patient ID`) patient_count
from healthdata.ocd_patient_dataset
Group by 1
Order by 1;

select 
`Obsession Type`,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as obs_score
from healthdata.ocd_patient_dataset
group by 1
Order by 2;

select
`Compulsion Type`,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Compulsions)`),2) as comp_score 
from healthdata.ocd_patient_dataset
group by 1
Order by 1;