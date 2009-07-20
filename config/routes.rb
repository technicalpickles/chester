ActionController::Routing::Routes.draw do |map|
  map.resources :sheets, :collection => { :recent => :get }
  map.root :controller => 'sheets', :action => 'recent'
  
  map.with_options :controller => 'sheets', :format => 'yaml' do |sheets|
    sheets.connect '/yr/',    :action => 'recent',  :conditions => { :method => :get }
    sheets.connect '/ya/',    :action => 'index',   :conditions => { :method => :get }
    sheets.connect '/y/:id',  :action => 'show',    :conditions => { :method => :get }
    sheets.connect '/w/',     :action => 'create',  :conditions => { :method => :post }
    # sheets.connect '/w/:id', :action => 'update', :conditions => { :method => :post }
  end
end
