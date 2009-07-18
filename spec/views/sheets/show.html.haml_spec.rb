require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sheets/show" do
  before do
    assigns[:sheet] = Factory.build(:sheet, :id => 1)
  end

  it "should render" do
    render 'sheets/show'
  end
end
