{{ config(materialized='table') }}

select *
from {{ source('mysource', 'public._airbyte_raw_ladestellen') }}
