require "spec_helper"

describe CtaBusApi do
  let(:subject) { described_class.new(key: "hello") }
  it "gets the current time from the api" do
    expect(subject.current_time).to eq("20090611 14:42:32")
  end

  it "gets all the available routes" do
    expect(subject.routes).to eq(["Indiana/Hyde Park", "Hyde Park Express", "King Drive", "King Drive Express"])
  end

  it "gets all the available vehicles" do
    expect(subject.vehicles).to eq([{"vid"=>"509", "tmstmp"=>"20090611 10:28", "lat"=>"41.92124938964844", "lon"=>"-87.64849853515625", "hdg"=>"358", "pid"=>"3630", "pdist"=>"5678", "rt"=>"8", "des"=>"Waveland/Broadway"}, {"vid"=>"392", "tmstmp"=>"20090611 10:28", "lat"=>"41.91095733642578", "lon"=>"87.64120713719782>", "hdg"=>"88", "pid"=>"1519", "pdist"=>"11203", "rt"=>"72", "des"=>"Clark"}])
  end
end
