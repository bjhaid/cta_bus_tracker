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

  it "gets all the available directions" do
    expect(subject.directions).to eq(["East Bound", "West Bound"])
  end

  it "gets all the available stops" do
    expect(subject.stops).to eq([{"stpid"=>"4727", "stpnm"=>"1633 W Madison", "lat"=>"41.881265", "lon"=>"-87.66849"}, {"stpid"=>"9604", "stpnm"=>"Austin & Pleasant/Fulton", "lat"=>"41.885206667", "lon"=>"-87.7748733333333"}, {"stpid"=>"9605", "stpnm"=>"Austin & Randolph/West End", "lon"=>"41.8838633333333", "lat"=>"-87.7748566666667"}, {"stpid"=>"9603", "stpnm"=>"Austin & South Blvd/Corcoran", "lat"=>"41.886908333", "lon"=>"-87.77493667"}])
  end

  it "gets all the available patterns" do
    expect(subject.patterns).to eq([{"pid"=>"954", "ln"=>"35569", "rtdir"=>"East Bound", "pt"=>{"seq"=>"3", "typ"=>"W", "lat"=>"41.880693089146", "lon"=>"-87.725674510002", "pdist"=>"97.0"}}])
  end

end
