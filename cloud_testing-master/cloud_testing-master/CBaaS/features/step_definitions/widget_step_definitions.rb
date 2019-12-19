

Given(/^I am authorized to make API requests$/) do
  @token_header = {:'Authorization' => "#{ENV['Authorization']}"}
  @Origin_header= {:'Origin' => "#{ENV['Origin']}"}
  @Content_type= {:'Content-Type' => "#{ENV['Content-Type']}"}
end

When(/^I make a "GET" request to API widget endpoint "\/api\/widget\/63e91617040a803a8072708af4aea8e9" route$/) do |method,route|

end

And(/^response should include below keys$/) do

end

And(/^response code must be (\d+)$/) do |code|
  puts @response_code
   expect(@response_code).to eq(code.to_i)

end

And(/^response should include "([^"]*)" and "([^"]*)"$/) do |arg1,arg2|
     expect(@response).to include(arg1,arg2)
  puts @response

end

When(/^I make a "(GET|[Gg]et)" request to API widget with endpoint "([^"]*)"$/) do |method,route|
  request(method,route)
end

When(/^I send invalid Origin in the headers$/) do
  @Origin_header = {:'Origin' => " "}
end

And(/^I send invalid content\-type in the headers$/) do
  @Content_type= {:'Content-Type' => "test"}
  puts @Content_type
end

Given(/^I send invalid Token in the headers$/) do
@token_header={'Authorization' => ""}


end

Given(/^I make a "(POST|[Pp]ost)" request to API widget with endpoint "([^"]*)"$/) do |arg1, arg2, text|
  @request_body=JSON.parse(text)
  puts @request_body
  request(arg1,arg2)

end