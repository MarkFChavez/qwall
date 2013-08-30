class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  
  protect_from_forgery

  def after_sign_in_path_for(resource)
  	home_index_url
  end
end
