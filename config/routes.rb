ActionController::Routing::Routes.draw do |map|
  map.resources :sheets
  map.root :controller => 'sheets'
end
