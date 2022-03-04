with rankings19 as (
                    with avg_rank_table as (
                                            select distinct name,
                                                   ranksystem,
                                                   avg(rank::float) avg_rank,
                                                   count(rank) rank_count
                                            from cbase2019
                                            group by name, ranksystem
                                            order by rank_count desc
                                           )
                    select trim(upper(name)) name,
                           round(avg(avg_rank)::decimal, 2) avg_rank_2019
                    from avg_rank_table
                    where rank_count >= 10
                    group by name
                    order by avg_rank_2019
                   ),
     rankings18 as (
                    with avg_rank_table as (
                                            select distinct name,
                                                   ranksystem,
                                                   avg(rank::float) avg_rank,
                                                   count(rank) rank_count
                                            from cbase2018
                                            group by name, ranksystem
                                            order by rank_count desc
                                           )
                    select trim(upper(name)) name,
                           round(avg(avg_rank)::decimal, 2) avg_rank_2018
                    from avg_rank_table
                    where rank_count >= 10
                    group by name
                    order by avg_rank_2018
                   ),
     rankings17 as (
                    with avg_rank_table as (
                                            select distinct name,
                                                   ranksystem,
                                                   avg(rank::float) avg_rank,
                                                   count(rank) rank_count
                                            from cbase2017
                                            group by name, ranksystem
                                            order by rank_count desc
                                           )
                    select trim(upper(name)) name,
                           round(avg(avg_rank)::decimal, 2) avg_rank_2017
                    from avg_rank_table
                    where rank_count >= 10
                    group by name
                    order by avg_rank_2017
                   ),
     rankings16 as (
                    with avg_rank_table as (
                                            select distinct name,
                                                   ranksystem,
                                                   avg(rank::float) avg_rank,
                                                   count(rank) rank_count
                                            from cbase2016
                                            group by name, ranksystem
                                            order by rank_count desc
                                           )
                    select trim(upper(name)) name,
                           round(avg(avg_rank)::decimal, 2) avg_rank_2016
                    from avg_rank_table
                    where rank_count >= 10
                    group by name
                    order by avg_rank_2016
                   ),
     rankings15 as (
                    with avg_rank_table as (
                                            select distinct name,
                                                   ranksystem,
                                                   avg(rank::float) avg_rank,
                                                   count(rank) rank_count
                                            from cbase2015
                                            group by name, ranksystem
                                            order by rank_count desc
                                           )
                    select trim(upper(name)) name,
                           round(avg(avg_rank)::decimal, 2) avg_rank_2015
                    from avg_rank_table
                    where rank_count >= 10
                    group by name
                    order by avg_rank_2015
                   ),
     rankings14 as (
                    with avg_rank_table as (
                                            select distinct name,
                                                   ranksystem,
                                                   avg(rank::float) avg_rank,
                                                   count(rank) rank_count
                                            from cbase2014
                                            group by name, ranksystem
                                            order by rank_count desc
                                           )
                    select trim(upper(name)) name,
                           round(avg(avg_rank)::decimal, 2) avg_rank_2014
                    from avg_rank_table
                    where rank_count >= 10
                    group by name
                    order by avg_rank_2014
                   ),
     rankings13 as (
                    with avg_rank_table as (
                                            select distinct name,
                                                   ranksystem,
                                                   avg(rank::float) avg_rank,
                                                   count(rank) rank_count
                                            from cbase2013
                                            group by name, ranksystem
                                            order by rank_count desc
                                           )
                    select trim(upper(name)) name,
                           round(avg(avg_rank)::decimal, 2) avg_rank_2013
                    from avg_rank_table
                    where rank_count >= 10
                    group by name
                    order by avg_rank_2013
                   ),
     rankings12 as (
                    with avg_rank_table as (
                                            select distinct name,
                                                   ranksystem,
                                                   avg(rank::float) avg_rank,
                                                   count(rank) rank_count
                                            from cbase2012
                                            group by name, ranksystem
                                            order by rank_count desc
                                           )
                    select trim(upper(name)) name,
                           round(avg(avg_rank)::decimal, 2) avg_rank_2012
                    from avg_rank_table
                    where rank_count >= 10
                    group by name
                    order by avg_rank_2012
                   ),
     rankings11 as (
                    with avg_rank_table as (
                                            select distinct name,
                                                   ranksystem,
                                                   avg(rank::float) avg_rank,
                                                   count(rank) rank_count
                                            from cbase2011
                                            group by name, ranksystem
                                            order by rank_count desc
                                           )
                    select trim(upper(name)) name,
                           round(avg(avg_rank)::decimal, 2) avg_rank_2011
                    from avg_rank_table
                    where rank_count >= 10
                    group by name
                    order by avg_rank_2011
                   )
select name,
       avg_rank_2011,
       rank() over(order by avg_rank_2011) rank11,
       avg_rank_2012,
       rank() over(order by avg_rank_2012) rank12,
       avg_rank_2013,
       rank() over(order by avg_rank_2013) rank13,
       avg_rank_2014,
       rank() over(order by avg_rank_2014) rank14,
       avg_rank_2015,
       rank() over(order by avg_rank_2015) rank15,
       avg_rank_2016,
       rank() over(order by avg_rank_2016) rank16,
       avg_rank_2017,
       rank() over(order by avg_rank_2017) rank17,
       avg_rank_2018,
       rank() over(order by avg_rank_2018) rank18,
       avg_rank_2019,
       rank() over(order by avg_rank_2019) rank19,
       round((avg_rank_2011 + avg_rank_2012 + avg_rank_2013 + avg_rank_2014 + avg_rank_2015 + avg_rank_2016 + avg_rank_2017 + avg_rank_2018 + avg_rank_2019)/9, 2) as avg_rank_total
from rankings11
     join rankings12 using(name)
     join rankings13 using(name)
     join rankings14 using(name)
     join rankings15 using(name)
     join rankings16 using(name)
     join rankings17 using(name)
     join rankings18 using(name)
     join rankings19 using(name)
order by rank11;