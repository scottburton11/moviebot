require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe MovieBot::ImageConverter do
  before(:each) do
    project_home = mock("project_home")
    project_home.should_receive(:path).and_return("/Users/scott/DMTH_examples/CL005_PLATE/")
    @image_converter = MovieBot::ImageConverter.new(project_home.path)
  end
  
  it "should have an array of paths to frames" do
    @image_converter.frames.should be_a_kind_of(Array)
  end
  

end