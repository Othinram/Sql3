select bus_id, count(passenger_id) as passengers_cnt
from (select bus_id,
case when Lag(passenger_id, 1) OVER(ORDER BY bus_id) = passenger_id then null
else passenger_id 
end as passenger_id
from Buses B
join Passengers P
on p.arrival_time <= B.arrival_time
order by bus_id) A
group by 1; 
