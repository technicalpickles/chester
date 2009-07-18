require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sheet do

  describe "recent" do
    before do
      20.times { Factory(:sheet) }
      @very_recent_sheet = Factory(:recent_sheet, :title => 'Recent')
      @very_old_sheet = Factory(:old_sheet, :title => 'Old')
      
      @recent_sheets = Sheet.recent
    end
    
    it "should contain very recent sheet" do
      @recent_sheets.should include(@very_recent_sheet)
    end
    
    it 'should return sheets in reverse-chronological order' do
      @recent_sheets.should == @recent_sheets.sort { |x,y| y.updated_at <=> x.updated_at }
    end
    
    it 'should not contain a very old sheet' do
      @recent_sheets.should_not include(@very_old_sheet)
    end
    
    it "should have exactly 15 sheets" do
      @recent_sheets.size.should == 15
    end
  
    
  end
end
