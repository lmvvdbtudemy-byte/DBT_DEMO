WITH CTE AS (

select 
to_timestamp(started_at) as started_at,
date(to_timestamp(started_at)) as date_started_at,
hour(to_timestamp(started_at)) as hour_started_at,

{{day_type('STARTED_AT')}} AS DAY_TYPE,

{{get_season('STARTED_AT')}} as station_of_year

from {{ ref('stg_bike') }}

)

select * from cte