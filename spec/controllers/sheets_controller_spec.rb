require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SheetsController do
  
  describe '#index' do
    before do
      @all_sheets = "alphabetical by title"
      stub(Sheet).alphabetically_by_title { @all_sheets }
    
      get :index
    end
    
    it { should assign_to(:sheets).with(@all_sheets) }
    
    it "should find sheets alphabetically by title" do
      Sheet.should have_received(:alphabetically_by_title)
    end
  end

  describe "#recent" do
    
    before do
      @recent_sheets = "recent sheets"
      stub(Sheet).fifteen_recent { @recent_sheets }
      
      get :recent
    end

    it { should respond_with(:success) }
    
    it { should assign_to(:recent_sheets).with(@recent_sheets) }
    
    it 'should load recently-edited sheets' do
      Sheet.should have_received(:fifteen_recent) 
    end

  end


end
