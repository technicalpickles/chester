require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sheets/edit" do
  before do
    assigns[:sheet] = stub_model(Sheet)
  end

  it "should render" do
    render 'sheets/edit'
  end
end
