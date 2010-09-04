ActionController::Routing::Routes.draw do |map|
  map.resources :clues, :only => :index
  map.resources :tracks
  map.root :controller => :home
end
