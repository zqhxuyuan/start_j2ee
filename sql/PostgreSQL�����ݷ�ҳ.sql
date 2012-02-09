﻿[MySQL和PostgreSQL分页语法比较]MySQL				PostgreSQL				功能说明				分页区间		limit a,b			limit b offset a		返回a后b条记录		[a+1, a+b]limit b				limit b					返回前b条记录 			[1,b]limit 0,b			limit b offset 0		等价上面的语法limit a,1			limit 1 offset a		返回第a+1条记录,b=1	[a+1,a+1][PostgreSQL大数据量分页优化]A.	和MySQL大数据分页优化不同的是,在最外层多了order by id.mysql查询时,会根据id自动默认升序排列.但是postgresql就不会自动根据id升序排列,导致分页时,更改N的值,分页的内容仍然一样.B.	实际应用中,如果不是select *,而是查询时要关联别的表(业务逻辑可能有点复杂),这时采用第一种方式查询速度会很慢.可以采用2.3.4C.	如果不是查所有的记录,比如对表数据做了权限控制.则权限控制where id in(...)也不要放在where后面,最好放在select id from bigdata where id in(...) order by id1.	Select * From bigdata order by id limit 100 offset 900002.	Select * From bigdata 	Where ID>=(							--定位到第N+1条记录,类似于offset N ↓		Select Max(ID) From (			--前N+1条最大id,即第N+1条	↑	 		Select ID From bigdata 			 		Order By ID limit 90001		--前N+1条记录升序排列 ↑		) As tmp	)	order by id 						--根据id升序排列	limit 100;							--每页条数3.	Select * From bigdata Where ID>=(		Select Max(ID) From (	 		Select ID From bigdata Order By ID limit 1 offset 90000		) As tmp	) 	order by id 	limit 100;4.	Select * From bigdata Where ID>=(		Select ID From bigdata limit 1 offset 90000	)	order by id	limit 100;	