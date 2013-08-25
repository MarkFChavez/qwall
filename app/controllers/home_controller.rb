class HomeController < ApplicationController

  before_filter :authenticate_user!, only: :index
  layout "dashboard"

  def index
  	@users = User.where("id <> :id", {id: current_user.id})
  	@posts = Post.all
  end

end
