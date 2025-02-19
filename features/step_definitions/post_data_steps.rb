require 'rest-client'
require 'json'
require 'rspec/expectations'

Given("I have the API endpoint {string}") do |url|
  @url = url
end

Given("I have the following data to post:") do |table|
  @post_data = {}
  table.hashes.each do |row|
    @post_data['title'] = row['title']
    @post_data['body'] = row['body']
    @post_data['userId'] = row['userId']
  end
end

When("I send a POST request with the data") do
  @response = RestClient.post(@url, @post_data.to_json, {content_type: :json, accept: :json})
  puts "dataku :  #{@response}"
end

Then("the response status should be {int}") do |expected_status|    
  expect(@response.code).to eq(expected_status)
end

Then("the response should contain the title {string}") do |expected_title|
  response_body = JSON.parse(@response.body)
  expect(JSON.parse(response_body['title'])).to eq(expected_title)
end