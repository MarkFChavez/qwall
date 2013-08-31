class UserFavoritesController < ApplicationController

  before_filter :authenticate_user!

  SUCCESS = 0
  ERROR = 1

  def create
  	@post = Post.find(params[:user_favorite][:post_id])
  	@favorite = current_user.favorites << @post

  	respond_to do |format|
	  	format.html { redirect_to home_index_path }
	  	format.json do
	  		render json: { result: SUCCESS }
	  	end
	end
  end

  def update
  end

  def destroy
  	@post = params[:user_favorite][:post_id]
  	@favorite = current_user.favorites.find_by_post_id(@post)

  	respond_to do |format|
	  	if @favorite.destroy
	  		format.html { redirect_to home_index_path, notice: "You have unfavorited something!" }
	  		format.json do
	  			render json: { result: SUCCESS }
	  		end
	  	else
	  		format.html { redirect_to home_index_path, alert: "Oops! An error has occurred." }
	  		format.json do
	  			render json: { result: ERROR }
	  		end
	  	end
	end
  end
end
