Feature: API POST request automation

  Scenario: Successfully posting data to an API
    Given I have the API endpoint "https://jsonplaceholder.typicode.com/posts"
    And I have the following data to post:
      | title  | body   | userId |
      | "foo"  | "bar"  | 1      |
    When I send a POST request with the data
    Then the response status should be 201
    And the response should contain the title "foo"
