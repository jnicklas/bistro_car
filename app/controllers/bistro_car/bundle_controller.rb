class BistroCar::BundleController < ActionController::Base
  caches_page :show

  def show
    render :text => BistroCar::Bundle.new(params[:bundle]).to_javascript
  end
end