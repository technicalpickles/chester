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
  
  shared_examples_for 'a sheet finder' do
    it { should respond_with(:success) }
    it { should assign_to(:sheet).with(@sheet) }
  end
  
  describe "#show" do
    
    before do
      stub(Sheet).find { nil }
      stub(Sheet).find_by_title { nil }
    end
    
    describe 'with an ID' do
      before do
        stub(Sheet).find { "the sheet" }
        get :show, :id => 12345
      end
      
      it_should_behave_like 'a sheet finder'
      it 'find the Sheet by ID' do
        Sheet.should have_received(:find).with('12345')
      end
    end
    
    describe 'with a sheet name' do
      before do
        stub(Sheet).find_by_title { "the sheet" }
        get :show, :id => 'some sheet'
      end
      
      it_should_behave_like 'a sheet finder'
      
      it 'find the Sheet by title' do
        Sheet.should have_received(:find_by_title).with('some sheet')
      end
    end
    
  end
  
  describe '#create with the weird API params' do
    
    before do
      @sheet = Factory(:sheet)
      stub(@controller).compensate_for_cheat_gem_params do
        @controller.params = { :sheet => { :title => @sheet.title, :body => @sheet.body } }
        nil
      end
      post :create
    end
    
    it 'compensate for weirt API params' do
      @controller.should have_received(:compensate_for_cheat_gem_params)
    end
    
  end
  
  describe '#create with format YAML' do
    
    before do
      @sheet = Factory(:sheet)
      stub(Sheet).new { @sheet }
      stub(Sheet).create { @sheet }
      stub(Sheet).create! { @sheet }
      post :create, :format => 'yaml', :sheet => { :title => @sheet.title, :body => @sheet.body }
    end
    
    it { should respond_with(201) }
    
    it 'should set the Location header to the newly-created sheet' do
      @response.headers['Location'].should == sheet_url(@sheet)
    end
    
  end
  
  describe 'compensating for the weird API params' do
    
    before do
      @controller.instance_eval do
        def public_compensate_for_cheat_gem_params
          compensate_for_cheat_gem_params
        end
      end
    end
    
    it 'should pull out sheet_title' do
      @controller.params = { :sheet_title => 'pretzels' }
      @controller.public_compensate_for_cheat_gem_params
      @controller.params[:sheet][:title].should == 'pretzels'
    end
    
    it 'should pull out sheet_body' do
      @controller.params = { :sheet_body => 'salty goodness' }
      @controller.public_compensate_for_cheat_gem_params
      @controller.params[:sheet][:body].should == 'salty goodness'
    end
    
    it 'should not overwrite regular params' do
      @controller.params = {
        :sheet => { :title => 'pinochle', :body => 'play some fun cards' },
        :sheet_title => 'basketball',
        :sheet_body => 'be the Harlem Globetrotters'
      }
      @controller.public_compensate_for_cheat_gem_params
      @controller.params[:sheet][:title].should == 'pinochle'
      @controller.params[:sheet][:body].should == 'play some fun cards'
    end
    
  end
  
end