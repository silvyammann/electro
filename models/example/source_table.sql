{{ config(materialized='table') }}

select *
from {{ source('mysource', 'mydb.public._airbyte_raw_ladestellen') }}

