with operators as (
    select evse_data->'EVSEDataRecord' as datarecord, id, name
    from {{ ref('operators') }}
)
select 
  (locations.location_data->'EvseID')::text as id,
  operators.id as operator_id,
  'charging_station' as amenity,
  operators.name as operator,
  (locations.location_data->'ChargingStationId')::text as reference,
  (locations.location_data->'Plugs')::json as socket,
  (locations.location_data->'Accessibility')::text as fee,
  (locations.location_data->'OpeningTimes')::text as opening_hours,
  (locations.location_data->'PaymentOptions')::text as payment,
  (locations.location_data->'AuthenticationModes')::text as authentication,
  (locations.location_data->'GeoCoordinates'->'Google')::text as coordinates
from operators
cross join lateral (select json_array_elements(operators.datarecord::json) as location_data) as locations
