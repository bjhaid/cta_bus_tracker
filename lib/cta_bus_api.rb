require "bundler/setup"
Bundler.require(:default)
require "open-uri"

class CtaBusApi

  attr_accessor :url
  def initialize(options = {})
    @key = options[:key]
    @url ||= "http://localhost:9292/bustime/api/v1/"
  end

  def current_time
    call_url "gettime"
    parsed_response
  end

  def routes(options)
    raise "route_id must be an integer" unless options[:route_id].is_a? Integer
    options.merge! path: "getroutes"
    call_url convert_to_extension(options)
    return "There was an error fetching the routes" if error?
    parsed_response["route"]
  end

  def vehicles
    call_url "getvehicles"
    parsed_response["vehicle"]
  end

  def directions
    call_url "getdirections"
    parsed_response["dir"]
  end

  def stops
    call_url "getstops"
    parsed_response["stop"]
  end

#patterns({route_id: 20, pattern_id: 959})
#or 
#patterns({route_id: 20, pattern_id: [954,959]})
  def patterns(options)
    raise "route_id should be an Integer" unless options.values.all? { |value| value.is_a?(Integer) || value.is_a?(Array) }
    if options[:pattern_id].is_a?(Array)
      raise "pattern_id should be an Integer or an Array of Integers" unless options[:pattern_id].all? { |pattern_id| pattern_id.is_a? Integer }
    end
    call_url "getpatterns"
    parsed_response["ptr"]
  end

  def predictions
    call_url "getpredictions"
    parsed_response["prd"]
  end

  def service_bulletins
    call_url "getservicebulletins"
    parsed_response["sb"]
  end

  def error?
    return true if parsed_response.nil?
    return true unless parsed_response["error"].nil?
  end

  private
  def call_url extension
    response = open(url + extension)
    parser = Nori.new
    @parsed_response = parser.parse(response.string)["bustime_response"]
  end

  def convert_to_extension options
    options.merge! key: @key unless @key.nil?
    "#{options.delete(:path)}?#{options.inject("") { |str,(k,v)| str << "#{k}=#{v}" } }"
  end
  attr_reader :parsed_response
end
