require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sheets/show.yaml" do
  before do
    sheet = Object.new
    stub(sheet).title { 'a title' }
    stub(sheet).body { 'a body' }
    assigns[:sheet] = sheet
  end

  it "should render" do
    render 'sheets/show.yaml.erb'
  end
  
  it 'should show the title' do
    render 'sheets/show.yaml.erb'
    response.body.should match(/a title/)
  end
  
  it 'should show the body' do
    render 'sheets/show.yaml.erb'
    response.body.should match(/a body/)
  end
end