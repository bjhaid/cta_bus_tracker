require "sinatra"
require "sinatra/reloader"

# http://www.ctabustracker.com/bustime/api/v1/gettime
get "/bustime/api/v1/gettime" do
  content_type "text/xml"
  send_file "index.xml"
end

# http://www.ctabustracker.com/bustime/api/v1/getroutes
get "/bustime/api/v1/getroutes" do
  content_type "text/xml"
  send_file "get_routes.xml"
end

# http://www.ctabustracker.com/bustime/api/v1/getvehicles
get "/bustime/api/v1/getvehicles" do
  content_type "text/xml"
  send_file "get_vehicles.xml"
end

# http://www.ctabustracker.com/bustime/api/v1/getdirections
get "/bustime/api/v1/getdirections" do
  content_type "text/xml"
  send_file "get_directions.xml"
end

# http://www.ctabustracker.com/bustime/api/v1/getstops
get "/bustime/api/v1/getstops" do
  content_type "text/xml"
  send_file "get_stops.xml"
end

# http://www.ctabustracker.com/bustime/api/v1/getpatterns
get "/bustime/api/v1/getpatterns" do
  content_type "text/xml"
  send_file "get_patterns.xml"
end

# http://www.ctabustracker.com/bustime/api/v1/getpredictions
get "/bustime/api/v1/getpredictions" do
  content_type "text/xml"
  send_file "get_predictions.xml"
end

# http://www.ctabustracker.com/bustime/api/v1/getservicebulletins
get "/bustime/api/v1/getservicebulletins" do
  content_type "text/xml"
  send_file "get_service_bulletins.xml"
end
