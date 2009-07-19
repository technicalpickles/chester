ActionController::Routing::Routes.draw do |map|
  map.resources :sheets, :collection => { :recent => :get }
  map.root :controller => 'sheets', :action => 'recent'
  
  #map.with_options :controller => 'sheets', :format => 'yaml' do |sheets|
  #  map.connect '/yr/', :action => 'recent'
  #  map.connect '/ya/', :action => 'all'
  #  map.connect '/y/:name', :action => 'show'
  #end
end
