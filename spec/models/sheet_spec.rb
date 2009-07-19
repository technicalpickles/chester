require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sheet do
  
  describe 'alphabetically_by_title' do

    it 'should respond to alphabetically_by_title' do
      Sheet.should respond_to(:alphabetically_by_title)
    end
    
    describe "with three randomly named sheets" do
      before do
        ['wtf', 'zerglings', 'zomg'].each { |title| Factory(:sheet, :title => title) }
        @sheets = Sheet.alphabetically_by_title
      end
      
      it 'should return sheets' do
        @sheets.select {|sheet| ! sheet.kind_of?(Sheet) }.should == []
      end
      
      it "should have all of the existing sheets" do
        @sheets.size.should == Sheet.all.to_a.size
      end
      
      it 'should return sheets in (ascending) alphabetical order by title' do
        @sheets.should == @sheets.sort_by(&:title)
      end
      

      
    end
    
  end
  
  shared_examples_for 'a chronological list of non-nil sheets' do
    
    it 'should not have any nil objects' do
      @recent_sheets.should_not include(nil)
    end
    
    it 'should return sheets in reverse-chronological order' do
      @recent_sheets.should == @recent_sheets.sort { |x,y| y.updated_at <=> x.updated_at }
    end
    
  end

  describe "recent" do
    
    describe "with no sheets saved" do
      before do
        Sheet.delete_all
        @recent_sheets = Sheet.fifteen_recent
      end
      
      it_should_behave_like 'a chronological list of non-nil sheets'
      
      it 'should not return any sheets' do
        @recent_sheets.should be_empty
      end
      
    end
    
    describe "with a whole slew of sheets" do
    
      before do
        20.times { Factory(:sheet) }
        @very_recent_sheet = Factory(:recent_sheet, :title => 'Recent')
        @very_old_sheet = Factory(:old_sheet, :title => 'Old')
      
        @recent_sheets = Sheet.fifteen_recent
      end
    
      it "should contain very recent sheet" do
        @recent_sheets.should include(@very_recent_sheet)
      end
    
      it_should_behave_like 'a chronological list of non-nil sheets'
    
      it 'should not contain a very old sheet' do
        @recent_sheets.should_not include(@very_old_sheet)
      end
    
      it "should have exactly 15 sheets" do
        @recent_sheets.size.should == 15
      end
    
      it "should not have any nil objects" do
        @recent_sheets.should_not include(nil)
      end
      
    end
  
    
  end
end
