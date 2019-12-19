Feature: CBass widget functionality
  As a user
  I want to request the widget data
Background:
Given I am authorized to make API requests

Scenario: Successful Widget info validation
Given I make a "GET" request to API widget with endpoint "/api/widgets/117?cacheBuster=1570082149510"
Then response should include "id" and "name"
And response code must be 200

Scenario: Widget info with invalid origin
Given  I send invalid Origin in the headers
And I make a "GET" request to API widget with endpoint "/api/widgets/117?cacheBuster=1570082149510"
And response should include "error" and "cannot authenticate token"
Then response code must be 401

Scenario: Widget info with invalid token
Given  I send invalid Token in the headers
And I make a "GET" request to API widget with endpoint "/api/widgets/117?cacheBuster=1570082149510"
And response should include "error" and "Invalid Authorization Token"
Then response code must be 401