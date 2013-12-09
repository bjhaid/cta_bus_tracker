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
    parsed_response["bustime_response"]
  end

  def routes
    call_url "getroutes"
    parsed_response["bustime_response"]["route"]
  end

  def vehicles
    call_url "getvehicles"
    parsed_response["bustime_response"]["vehicle"]
  end

  def directions
    call_url "getdirections"
    parsed_response["bustime_response"]["dir"]
  end

  def stops
    call_url "getstops"
    parsed_response["bustime_response"]["stop"]
  end

  def patterns
    call_url "getpatterns"
    parsed_response["bustime_response"]["ptr"]
  end

  def predictions
    call_url "getpredictions"
    parsed_response["bustime_response"]["prd"]
  end

  def service_bulletins
    call_url "getservicebulletins"
    parsed_response["bustime_response"]["sb"]
  end

  private
  def call_url extension
    response = open(url + extension)
    parser = Nori.new
    @parsed_response = parser.parse(response.string)
  end
  attr_reader :parsed_response
end
