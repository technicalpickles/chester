ActionController::Routing::Routes.draw do |map|
  map.resources :sheets
  map.root :controller => 'sheets'
  
  #map.with_options :controller => 'sheets', :format => 'yaml' do |sheets|
  #  map.connect '/yr/', :action => 'recent'
  #  map.connect '/ya/', :action => 'all'
  #  map.connect '/y/:name', :action => 'show'
  #end
end
