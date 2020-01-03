require 'rest_client'
require 'cucumber'



ENV['Authorization'] ||= "Token eyJhbGciOiJIUzI1NiJ9.eyJjYWxsYmFja19jbG91ZF9jbGllbnRfaWQiOjQsInVzZXJfYWN0aXZpdGllcyI6WyJlZGl0X3dpZGdldF90ZW1wbGF0ZXMiLCJlZGl0X3dpZGdldHMiLCJ2aWV3X3dpZGdldF90ZW1wbGF0ZXMiLCJ2aWV3X3dpZGdldHMiXSwiZXhwIjoxNTc4MDM4NDY0fQ.xCbWh2lIifBOKfg-TQtazRQ7KrcmAFrbCnqXJKBUKhw"
ENV['Origin'] ||= "https://mrqa2.vhtops.net"
ENV['Content-Type'] ||= "application/json"
ENV['URL'] ||= ""

def debug(obj='', *arg)
  return if ENV['Debug'].nil?
  if ENV['Debug'].downcase == "true"
    puts obj, *arg
  end
end