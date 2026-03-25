"!@testing Z923_R_TRAVEL
CLASS ltc_z923_r_travel DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    CLASS-DATA environment TYPE REF TO if_cds_test_environment.

    DATA td_z923_travel TYPE STANDARD TABLE OF z923_travel WITH EMPTY KEY.
    DATA act_results TYPE STANDARD TABLE OF z923_r_travel WITH EMPTY KEY.
    DATA exp_results TYPE STANDARD TABLE OF z923_r_travel WITH EMPTY KEY.

    "! In CLASS_SETUP, corresponding doubles and clone(s) for the CDS view under test and its dependencies are created.
    CLASS-METHODS class_setup RAISING cx_static_check.
    "! In CLASS_TEARDOWN, Generated database entities (doubles & clones) should be deleted at the end of test class execution.
    CLASS-METHODS class_teardown.

    "! SETUP method creates a common start state for each test method,
    "! clear_doubles clears the test data for all the doubles used in the test method before each test method execution.
    METHODS setup RAISING cx_static_check.

    "! In this method test data is inserted into the generated double(s) for test case
    "! "Test Z923_R_TRAVEL."
    METHODS td_test_cds_view.

    "! <strong>Test Case:</strong> Test Z923_R_TRAVEL. <br><br>
    "! Test CDS View as a whole.
    "! <br><br> The results should be asserted with the actuals.
    METHODS test_cds_view FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_Z923_R_TRAVEL IMPLEMENTATION.

  METHOD class_setup.
    environment = cl_cds_test_environment=>create( i_for_entity = 'Z923_R_TRAVEL' ).
  ENDMETHOD.

  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.

  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.

  METHOD test_cds_view.
    td_test_cds_view( ).
    SELECT * FROM z923_r_travel INTO TABLE @act_results.

    cl_abap_unit_assert=>assert_equals( exp = lines( exp_results ) act = lines( act_results ) msg = 'Test Generated using AI: Recheck test data' ).
  ENDMETHOD.

  METHOD td_test_cds_view.
    " Prepare test data for 'Z923_TRAVEL'
    td_z923_travel = VALUE #(
      (
        client = '100'
        agency_id = '000123'
        travel_id = '00004567'
        description = 'Summer Vacation'
        customer_id = '000789'
        begin_date = '20240601'
        end_date = '20240615'
        status = 'N'
        changed_at = '20240601123045'
        changed_by = 'USER001'
      ) ).
    environment->insert_test_data( i_data = td_z923_travel ).

    " Prepare test data for 'z923_r_travel'
    exp_results = VALUE #(
      (
           agencyid = '000123'
           travelid = '00004567'
           description = 'Summer Vacation'
           customerid = '000789'
           begindate = '20240601'
           enddate = '20240615'
           status = 'N'
           changedat = '20240601123045'
           changedby = 'USER001'
      ) ).
  ENDMETHOD.

ENDCLASS.
