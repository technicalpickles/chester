require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sheet::Importer do
  
  shared_examples_for 'importing one sheet' do
    it 'should return a Sheet' do
      @sheet.should be_kind_of(Sheet)
    end

    it 'should import the title' do
      @sheet.title.should == 'strftime'
    end

    it 'should import the body' do
      @sheet.body.should match(/Hour of the day, 12-hour clock/)
    end

    it 'should persist the sheet' do
      @sheet.should_not be_new_record
    end
  end
  
  describe 'importing one sheet from errtheblog' do
    
    before do
      strftime = { 'strftime' => '%l - Hour of the day, 12-hour clock w/o leading zeroes ( 1..12)' }.to_yaml
      FakeWeb.register_uri 'http://cheats.errtheblog.com:80/y/strftime', :string => strftime
      @sheet = Sheet::Importer::ErrTheBlog.new.import('strftime')
    end
    
    it_should_behave_like 'importing one sheet'
    
  end
  
  describe 'importing one sheet from a directory' do
    
    before do
      strftime = StringIO.new({ 'strftime' => '%l - Hour of the day, 12-hour clock w/o leading zeroes ( 1..12)' }.to_yaml)
      @sheet = Sheet::Importer::Directory.new('/a/dir').import(strftime)
    end

    it_should_behave_like 'importing one sheet'
    
  end
  
  describe 'importing all sheets' do
    
    before do
      @strftime_sheet = 'the strftime cheat sheet'
      @webrat_sheet = 'the webrat cheat sheet'
    end
    
    shared_examples_for 'importing all sheets' do
      it 'should contain the strftime and webrat sheets' do
        @sheets.should == [ @strftime_sheet, @webrat_sheet ]
      end
    end
  
    describe 'from errtheblog' do
    
      before do
        all_cheats = { 'All Cheat Sheets' => ['strftime', 'webrat'] }.to_yaml
        FakeWeb.register_uri 'http://cheats.errtheblog.com:80/ya/', :string => all_cheats
        @importer = Sheet::Importer::ErrTheBlog.new
        stub(@importer).import('strftime') { @strftime_sheet }
        stub(@importer).import('webrat') { @webrat_sheet }
        @sheets = @importer.import_all
      end
    
      it_should_behave_like 'importing all sheets'
    
    end
  
    describe 'from a directory' do
      
      before do
        stub(Dir).glob { ['strftime.yml', 'webrat.yml'] }
        strftime_file, webrat_file = Object.new, Object.new
        stub(File).new('strftime.yml') { strftime_file }
        stub(File).new('webrat.yml') { webrat_file }
        @importer = Sheet::Importer::Directory.new('/tmp')
        stub(@importer).import(strftime_file) { @strftime_sheet }
        stub(@importer).import(webrat_file) { @webrat_sheet }
        @sheets = @importer.import_all
      end  
    
      it_should_behave_like 'importing all sheets'
      
    end
    
  end
  
end