require 'rubygems'
require 'rest-client'
require 'uri'

  def request(method,route)
begin
   @response = RestClient.get("#{ENV['URL']}#{URI::encode(route)}",{:accept => :json}.merge(@Origin_header).merge(@token_header))
rescue RestClient::ExceptionWithResponse => e
    @response = e.http_body
    @response_code=e.http_code
    debug @response
  rescue => e
    puts "EXCEPTION #{e.message}"
end
case method.downcase
when "get"
begin
  debug @response
  @response_code = @response.code
rescue RestClient::ExceptionWithResponse => e
  @response_code = e.http_code
  @response = e.http_body
#  debug @response
rescue => e
  puts "EXCEPTION #{e.message}"
end
when "post"
begin
  @response = RestClient.post "#{ENV['Url']}#{URI::encode(route)}", @request_body.to_json, {:accept => :json, :content_type => :json}.merge(@token_header)
  debug @response
  @response_code = @response.code
rescue RestClient::ExceptionWithResponse => e
  @response_code = e.http_code
  @response = e.http_body
  puts "Response of the request is"+@response
  rescue => e
  puts "EXCEPTION #{e.message}"
end
else
  puts "invalid method"
end
end


