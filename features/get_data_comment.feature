Feature: API GET request automation

Scenario: Successfully get data to an API
    Given I have the API GET endpoint "https://jsonplaceholder.typicode.com/posts/1/comments"
    When I send a GET request
    Then the response status should be 200
    And the first index response should contain the name "id labore ex et quam laborum"