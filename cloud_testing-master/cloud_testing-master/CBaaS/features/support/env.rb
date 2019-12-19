require 'rest_client'
require 'uri'


ENV['Authorization'] ||= "Token eyJhbGciOiJIUzI1NiJ9.eyJjYWxsYmFja19jbG91ZF9jbGllbnRfaWQiOjQsInVzZXJfYWN0aXZpdGllcyI6WyJlZGl0X3dpZGdldF90ZW1wbGF0ZXMiLCJlZGl0X3dpZGdldHMiLCJ2aWV3X3dpZGdldF90ZW1wbGF0ZXMiLCJ2aWV3X3dpZGdldHMiXSwiZXhwIjoxNTc2MjQyMTI0fQ.NWuPOtoL5H8SZSFHFxDgeRLeX-aFDz1Q50U2l0eYk_4"
ENV['Origin'] ||= "https://mrqa2.vhtops.net"
ENV['Content-Type'] ||= "application/json"
ENV['URL'] ||= ""

def debug(obj='', *arg)
  return if ENV['Debug'].nil?
  if ENV['Debug'].downcase == "true"
    puts obj, *arg
  end
end