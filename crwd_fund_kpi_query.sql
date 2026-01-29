use crowdfunding_db;
select * from projects;

#Total Number of Projects (Overall)
select COUNT(*) as total_number_of_projects
from projects;

#Total Number of Projects Based on Outcome (State)
select state,count(*) as total_projects
from projects group by state;

#Total Number of Projects Based on Category
select category_id, count(*) as total_projects
from projects group by category_id;

#Total Number of Projects by Location (Country)
select country, count(*) as total_projects from projects
group by country order by total_projects desc;

#Projects Created by Year
select year(from_unixtime(created_at)) as project_year,count(*) as total_projects
from projects group by project_year order by project_year;

#Projects Created by Quarter
select year(from_unixtime(created_at)) as project_year,quarter(from_unixtime(created_at)) as project_quarter, count(*) as total_projects from projects
group by project_year, project_quarter order by project_year, project_quarter;

#Projects Created by Month
select year(from_unixtime(created_at)) as year,
month(from_unixtime(created_at)) as month,
count(*) as total_projects from projects
group by year(from_unixtime(created_at)), month(from_unixtime(created_at))
order by year, month;

#Year → Quarter → Month (Hierarchy)
select
year(from_unixtime(created_at)) as year,
quarter(from_unixtime(created_at)) as quarter,
month(from_unixtime(created_at)) as month,
count(*) as total_projects from projects
group by year(from_unixtime(created_at)),quarter(from_unixtime(created_at)),month(from_unixtime(created_at))
order by year, quarter, month;

#Total Amount Raised (Successful Projects)
select sum(pledged) as total_amount_raised
from projects where state = 'successful';

#Total Number of Backers (Successful Projects)
select sum(backers_count) as total_backers from projects
where state = 'successful';

#Average Number of Days for Successful Projects
select
avg(
    datediff(from_unixtime(deadline),from_unixtime(launched_at))) as avg_days
from projects where state = 'successful'
and created_at is not null and deadline is not null;

#Top Successful Projects Based on Number of Backers
select
ProjectID, name as project_name,
backers_count AS number_of_backers,
pledged AS amount_raised from projects
where state = 'successful' order by backers_count desc limit 10;

#Top Successful Projects Based on Amount Raised
select name,usd_pledged
from  projects
where  state = 'successful'
order by  usd_pledged desc
limit  10;

#Percentage of Successful Projects (Overall)
select (count(case when state = 'successful' then 1 end) * 100.0 / count(*)) as success_percentage
from projects;

#Percentage of Successful Projects by Category
select
category_id,
count(*) as total_projects,
sum(case when state = 'successful' then 1 else 0 end) as successful_projects,
round(
(sum(case when state = 'successful' then 1 else 0 end) * 100.0)/ count(*),2) as success_percentage
from projects group by category_id order by success_percentage desc;

#Percentage of Successful Projects by Year / Month
select
year(from_unixtime(created_at)) as year,
month(from_unixtime(created_at)) as month,
round(sum(case when state = 'successful' then 1 else 0 end) * 100.0 / count(*),2) as success_percentage
from projects where created_at is not null
group by year(from_unixtime(created_at)), month(from_unixtime(created_at))
order by year,month;

#Percentage of Successful projects by Goal Range 
select
case
    when goal < 5000 then 'below 5k'
    when goal between 5000 and 9999 then '5k - 10k'
    when goal between 10000 and 49999 then '10k - 50k'
    when goal between 50000 and 99999 then '50k - 100k'
    else 'above 100k'
  end as goal_range,
  count(*) as total_projects,
  sum(case when state = 'successful' then 1 else 0 end) as successful_projects,
  round(
    (sum(case when state = 'successful' then 1 else 0 end) * 100.0)
    / count(*),2) as success_percentage from projects
group by goal_range order by success_percentage desc;

    






 














    
    

