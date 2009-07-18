require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sheets/index" do
  it "should render" do
    render 'sheets/index'
  end
end
