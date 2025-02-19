require 'rest-client'
require 'json'
require 'rspec/expectations'

Given("I have the API GET endpoint {string}") do |url|
  @url = url
end

When("I send a GET request") do
  @response = RestClient.get(@url)
  puts "dataku :  #{@response}"
end

Then("the first index response should contain the name {string}") do |expected_title|
  response_body = JSON.parse(@response.body)
  expect((response_body[0]['name'])).to eq(expected_title)
end