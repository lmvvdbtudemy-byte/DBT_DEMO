{{
    config(materialized='table'
    )
}}

with trips as (

select
RIDE_ID,
-- RIDEABLE_TYPE,
date(to_timestamp(STARTED_AT)) as TRIP_DATE,
START_STATIO_ID AS START_STATION_ID,
END_STATION_ID,
MEMBER_CSUAL AS MEMBER_CASUAL,
TIMESTAMPDIFF(SECOND,to_timestamp(STARTED_AT),to_timestamp(ENDED_AT)) AS TRIP_DURATION_SECONDS

from {{ ref('stg_bike') }}

limit 10
)

select * 
from trips