with all_way as (
with recursive cte as (
	-- Начальная точка
	select point1 as all_p, city_graph.point1, 0 as rim_cost, 1 as node
	from city_graph
	where point1 = 'a'
	
	union all
	-- Рекурсия
	select cte.all_p || ',' || city_graph.point2, 
	city_graph.point2,
	cte.rim_cost + city_graph.cost,
	node + 1
	from city_graph
	join cte on cte.point1 = city_graph.point1
	where cte.all_p not like '%' || city_graph.point2 || '%'
)
select rim_cost + city_graph.cost as total_cost, '{' || cte.all_p || ',a' || '}' as tour
from cte
join city_graph on city_graph.point1 = cte.point1 and city_graph.point2 = 'a'
where node = 4
)

select distinct * from all_way
order by 1, 2