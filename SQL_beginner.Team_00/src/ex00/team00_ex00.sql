-- Создание таблицы
create table if not exists city_graph(point1 varchar, point2 varchar, cost int);
insert into city_graph (point1, point2, cost)
values('a', 'b', 10),
	('b', 'a', 10),
	('a', 'd', 20),
	('d', 'a', 20),
	('b', 'd', 25),
	('d', 'b', 25),
	('d', 'c', 30),
	('c', 'd', 30),
	('b', 'c', 35),
	('c', 'b', 35),
	('a', 'c', 15),
	('c', 'a', 15);
-- Запрос на удаление таблицы
DROP TABLE IF EXISTS city_graph;
with all_way as (
	with recursive cte as (
		-- Начальная точка
		select point1 as all_p,
			city_graph.point1,
			0 as rim_cost,
			1 as node
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
	select rim_cost + city_graph.cost as total_cost,
		'{' || cte.all_p || ',a' || '}' as tour
	from cte
		join city_graph on city_graph.point1 = cte.point1
		and city_graph.point2 = 'a'
	where node = 4
)
select distinct *
from all_way
where total_cost = (
		select min(total_cost)
		from all_way
	)
order by 1,
	2