class HomeController < ApplicationController

  before_filter :authenticate_user!, only: :index
  layout "dashboard"

  def index
  	@users = User.where("id <> :id", {id: current_user.id})
  	@posts = Post.all
  	@post = Post.new
  	@activities = PublicActivity::Activity.order("created_at DESC").limit(10)
  end

end
