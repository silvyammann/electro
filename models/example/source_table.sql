{{ config(materialized='table') }}

select *
from {{ source('mysource', '_airbyte_raw_ladestellen') }};
