require "spec_helper"

describe CtaBusApi do
  let(:subject) { described_class.new(key: "hello") }
  it "gets the current time from the api" do
    expect(subject.current_time).to eq({"tm"=>"20090611 14:42:32"})
  end

  context "route" do

    it "gets all the available routes" do
      expect(subject.routes(49)).to eq([{"rt"=>"1", "rtnm"=>"Indiana/Hyde Park"}, {"rt"=>"2", "rtnm"=>"Hyde Park Express"}, {"rt"=>"3", "rtnm"=>"King Drive"}, {"rt"=>"X3", "rtnm"=>"King Drive Express"}])
    end

    it "should raise exception if route_id is not an integer" do
      expect { subject.route(49.5) }.to raise_error
    end
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

  context "patterns" do

    it "gets all the available patterns" do
      expect(subject.patterns(20,959)).to eq({"pid"=>"954", "ln"=>"35569", "rtdir"=>"East Bound", "pt"=>[{"seq"=>"1", "typ"=>"S", "stpid"=>"409", "stpnm"=>"Madison & Pulaski", "lat"=>"41.880641167057", "lon"=>"-87.725835442543", "pdist"=>"0.0"}, {"seq"=>"2", "typ"=>"W", "lat"=>"41.880693089146", "lon"=>"-87.725765705109"}, {"seq"=>"3", "typ"=>"W", "lat"=>"41.880693089146", "lon"=>"-87.725674510002", "pdist"=>"97.0"}]})
    end

    it "raise an exception if route_id is not an Integer" do
      expect { subject.patterns(20.1,959) }.to raise_error
    end

    it "raise an exception if pattern_id is not an Integer" do
      expect { subject.patterns(20,959.2) }.to raise_exception
    end

  end

  it "get all the available predictions" do
    expect(subject.predictions).to eq([{"tmstmp"=>"20090611 14:34", "typ"=>"A", "stpid"=>"456", "stpnm"=>"Madison & Jefferson", "vid"=>"2013", "dstp"=>"891", "rt"=>"20", "rtdir"=>"West Bound", "rtdst"=>"Austin", "prdtm"=>"20090611 14:40"}, {"tmstmp"=>"20090611 14:34", "typ"=>"A", "stpid"=>"456", "stpnm"=>"Madison & Jefferson", "vid"=>"6435", "dstp"=>"1587", "rt"=>"20", "rtdir"=>"West Bound", "rtdst"=>"Austin", "prdtm"=>"20090611 14:48"}])
  end

  it "gets all the available service bulletins" do
    expect(subject.service_bulletins).to eq([{"sbj"=>"Stop Relocation", "dtl"=>"The westbound stop located at Madison/Lavergne has been moved to the northeast corner at\nMadison/Lavergne.", "brf"=>" The westbound stop located at Madison/Lavergne has been moved to the northeast corner at\nMadison/Lavergne.", "prty"=>"low", "srvc"=>{"rt"=>"20"}}, {"sbj"=>"Stop Relocations/Eliminations", "dtl"=>"Bus stops are being changed to provide faster travel time.", "brf"=>"Bus stops are being changed to provide faster travel time.", "prty"=>"low", "srvc"=>{"stpid"=>"456"}}])
  end
end
