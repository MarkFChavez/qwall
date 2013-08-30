class CommentsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :get_post

  SUCCESS = 0
  ERROR = 1

  def create
  	@comment = @post.comments.build(params[:comment])

  	respond_to do |format|
  		if @comment.save
  			format.html { redirect_to home_index_path, notice: "New comment was added." }
  			format.json do
  				render json: { comment: @comment, result: SUCCESS }
  			end
  		else
  			format.html { redirect_to home_index_path, alert: "Unable to create comment at this time." }
  			format.json do
  				render json: { result: ERROR }
  			end
  		end
  	end
  end

  def update
  end

  def destroy
  end

private
  
  def get_post
  	@post = current_user.posts.find(params[:post_id])
  end
end
