with tmp as (
    select _airbyte_data->'EVSEData' as EVSEData
    from {{ ref('source_table') }}
)
select (tmp2.evse_data->'OperatorID')::text as id, (tmp2.evse_data->'OperatorName')::text as name, tmp2.evse_data
from tmp
cross join lateral (select json_array_elements(tmp.EVSEData::json) as evse_data) as tmp2

