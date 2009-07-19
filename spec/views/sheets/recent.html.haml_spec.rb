require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sheets/show" do
  before do
    assigns[:recent_sheets] = [Factory(:sheet)]
  end

  it "should render" do
    render 'sheets/recent'
  end
end
