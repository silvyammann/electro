with operators as (
    select evse_data->'EVSEDataRecord' as datarecord, id
    from {{ ref('operators') }}
)
select (locations.location_data->'EvseID')::text as id, operators.id as operator_id, locations.location_data as location_data
from operators
cross join lateral (select json_array_elements(operators.datarecord::json) as location_data) as locations
