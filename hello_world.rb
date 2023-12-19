# frozen_string_literal: true

# Our Rack application to be executed by rackup
class HelloWorld < Roda
  
    route do |r|
      response["Date"] = Time.now.httpdate
      response["Server"] = SERVER_STRING if SERVER_STRING
      #default content type
      response["Content-Type"] = "application/json"
  
  
      # Test type 2: Single database query
      r.is "db" do        
        Table.limit(1).map do |user|
            user.values
        end.to_json        
      end
    end
end