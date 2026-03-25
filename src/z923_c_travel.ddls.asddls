@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Sidhish - Root view projection'

@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true

define root view entity Z923_C_TRAVEL
  provider contract transactional_query
  as projection on Z923_R_TRAVEL

{
  key AgencyId,
  key TravelId,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.5
      Description,

      @Search.defaultSearchElement: true
      CustomerId,

      BeginDate,
      EndDate,
      Status,
      ChangedAt,
      ChangedBy
}
