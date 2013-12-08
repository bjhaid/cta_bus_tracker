require "nokogiri"
require "open-uri"

class CtaBusApi

  def initialize(key: you_must_supply_a_key)
  end

  def current_time
    call_url "gettime"
    parsed_response.xpath("//tm").text
  end

  def routes
    call_url "getroutes"
    parsed_response.xpath("//route//rtnm").map(&:text)
  end

  def vehicles
    call_url "getvehicles"
    parsed_response.xpath("//vehicle").map do |vehicle|
      vehicle.children.each_with_object({}) { |vehicle_attr,hash|
      hash[vehicle_attr.name] = vehicle_attr.text }
    end
  end

  def directions
    call_url "getdirections"
    parsed_response.xpath("//dir").map(&:text)
  end

  def stops
    call_url "getstops"
    parsed_response.xpath("//stop").map do |stop|
     stop.children.each_with_object({}) do |ele,hash|
       hash[ele.name] = ele.text
     end
    end
  end

  def patterns
    call_url "getpatterns"
    parsed_response.xpath("//ptr").map do |ptr|
      ptr.children.each_with_object({}) do |ele,hash|
        if ele.children.any? { |child| child.is_a? Nokogiri::XML::Element }
          hash[ele.name] = ele.children.each_with_object({}) { |e,child_hash| child_hash[e.name] = e.text }
        else
          hash[ele.name] = ele.text
        end
      end
    end
  end

  def predictions
    call_url "getpredictions"
    parsed_response.xpath("//prd").map do |prediction|
      prediction.children.each_with_object({}) do
        |ele, hash|
        hash[ele.name] = ele.text
      end
    end
  end

  private
  def call_url extension
    response = open("http://localhost:9292/bustime/api/v1/#{extension}")
    @parsed_response = Nokogiri.parse(response)
  end
  attr_reader :parsed_response
end
