Feature: CBass widget functionality
  As a user
  I want to request the widget data

  Background:
   Given I am authorized to make API requests
@GET
  Scenario: Get API widget response
  When I make a "GET" request to API widget with endpoint "/api/widget/929e1d09807714268873d62aae3ebeda"
  And response should include "widget_state" and "message"
  Then response code must be 200
  @GET
  Scenario: Get disabled API widget response
    When I make a "GET" request to API widget with endpoint "/api/widget/f6d681afea39d555f455f0dc79af9422"
    And response should include "WidgetNotFound" and "We are currently unable to accept callback requests"
    Then response code must be 404
@POST
  Scenario: ASAP call through widget
    Given I make a "POST" request to API widget with endpoint "/api/widget/929e1d09807714268873d62aae3ebeda/request_callback"
      """
      {"contact_number":"8019484836", "appointment_time":null}
  """
    And response should include "requested" and "callback_request_id"
    And response code must be 200

  @POST
  Scenario: Duplicate request through widget
    Given I make a "POST" request to API widget with endpoint "/api/widget/929e1d09807714268873d62aae3ebeda/request_callback"
      """
      {"contact_number":"8019484836", "appointment_time":null}
  """
    And response should include "DuplicateRequest" and "A Callback Request is already being made for this number"
    And response code must be 400
  @POST
  Scenario: Invalid contact number
    Given I make a "POST" request to API widget with endpoint "/api/widget/929e1d09807714268873d62aae3ebeda/request_callback"
      """
      {"contact_number":" ", "appointment_time":null}
  """
    And response should include "ContactRequired" and "Please enter a valid phone number"
    And response code must be 400

