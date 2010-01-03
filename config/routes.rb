ActionController::Routing::Routes.draw do |map|
  map.connect 'javascripts/bundle/:bundle.js', :controller => 'bistro_car/bundle', :action => 'show'
end
