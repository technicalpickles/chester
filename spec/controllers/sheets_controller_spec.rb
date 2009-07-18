require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SheetsController do

  describe "#index" do
    
    before do
      @recent_sheets = "recent sheets"
      stub(Sheet).recent { @recent_sheets }
      
      get :index
    end

    it { should respond_with(:success) }
    
    it { should assign_to(:recent_sheets).with(@recent_sheets) }
    
    it 'should load recently-edited sheets' do
      Sheet.should have_received(:recent) 
    end


  end


end
