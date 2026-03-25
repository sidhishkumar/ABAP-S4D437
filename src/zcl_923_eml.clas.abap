CLASS zcl_923_eml DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    CONSTANTS c_agency_id TYPE /dmo/agency_id VALUE '070000'.
    CONSTANTS c_travel_id TYPE /dmo/travel_id VALUE '00010469'.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_923_eml IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    READ ENTITIES OF z923_r_travel
         ENTITY z923_r_travel ALL FIELDS WITH
         VALUE #( ( AgencyId = c_agency_id )
                  ( TravelId = c_travel_id ) )
         " TODO: variable is assigned but never used (ABAP cleaner)
         RESULT DATA(li_result)
         FAILED DATA(li_failed).


    IF li_failed IS NOT INITIAL.
      out->write( 'Error in retriveing the travel data' ).
    ENDIF.
    out->write( li_result ).
  ENDMETHOD.
ENDCLASS.
