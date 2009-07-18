require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SheetsController do

  describe "#index" do
    before do
      get :index
    end

    it { should respond_with(:success) }

  end


end
