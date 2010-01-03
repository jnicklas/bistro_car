class BistroCar::BundleController < ActionController::Base
  caches_page :show

  def show
    headers['Content-Type'] = "application/javascript"
    render :text => BistroCar::Bundle.new(params[:bundle]).to_javascript
  end
end