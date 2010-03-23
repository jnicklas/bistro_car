if Rails.respond_to?(:application) # Rails 3
  Rails.application.routes.draw do
    match 'javascripts/bundle/:bundle.js', :to => 'bistro_car/bundle#show'
  end
else # Rails 2.3
  ActionController::Routing::Routes.draw do |map|
    map.connect 'javascripts/bundle/:bundle.js', :controller => 'bistro_car/bundle', :action => 'show'
  end
end
