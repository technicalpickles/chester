require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SheetsController do
  
  shared_examples_for 'an HTML view' do
    it 'should respond with HTML' do
      response.content_type.should match(/html/i)
    end
  end
  
  shared_examples_for 'a YAML view' do
    it 'should respond with YAML' do
      response.content_type.should match(/yaml/i)
    end
  end
  
  shared_examples_for 'an alphabetical listing of sheets' do
    it { should assign_to(:sheets).with(@all_sheets) }
    it "should find sheets alphabetically by title" do
      Sheet.should have_received(:alphabetically_by_title)
    end
  end
  
  describe '#index' do
    
    before do
      @all_sheets = "alphabetical by title"
      stub(Sheet).alphabetically_by_title { @all_sheets }
    end
    
    describe 'in HTML' do
      before { get :index }
      it_should_behave_like 'an alphabetical listing of sheets'
      it_should_behave_like 'an HTML view'
    end
    
    describe 'in YAML' do
      before { get :index, :format => 'yaml' }
      it_should_behave_like 'an alphabetical listing of sheets'
      it_should_behave_like 'a YAML view'
    end
  end
  
  shared_examples_for 'a listing of fifteen recent sheets' do
    it { should respond_with(:success) }
    it { should assign_to(:recent_sheets).with(@recent_sheets) }
    it "should find fifteen recently-edited sheets" do
      Sheet.should have_received(:fifteen_recent)
    end
  end

  describe "#recent" do
    
    before do
      @recent_sheets = "recent sheets"
      stub(Sheet).fifteen_recent { @recent_sheets }
    end
    
    describe 'in HTML' do
      before { get :recent }
      it_should_behave_like 'a listing of fifteen recent sheets'
      it_should_behave_like 'an HTML view'
    end
    
    describe 'in YAML' do
      before { get :recent, :format => 'yaml' }
      it_should_behave_like 'a listing of fifteen recent sheets'
      it_should_behave_like 'a YAML view'
    end
    
  end
  
end