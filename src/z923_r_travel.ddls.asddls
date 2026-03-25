@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel root view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z923_R_TRAVEL
  as select from z923_travel

{

  key agency_id   as AgencyId,
  key travel_id   as TravelId,
      description as Description,
      customer_id as CustomerId,
      begin_date  as BeginDate,
      end_date    as EndDate,
      status      as Status,
      changed_at  as ChangedAt,
      changed_by  as ChangedBy

}
