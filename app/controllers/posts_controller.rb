class PostsController < ApplicationController

  before_filter :authenticate_user!

  def create
  	@post = current_user.posts.build(params[:post])

  	respond_to do |format|
  		if @post.save
  			format.html { redirect_to home_index_url, notice:"Your post is processed successfully!" }
  			format.json do 
  				render json: { notice:"Your post is processed successfully!", operation_status: 0 }
  			end
  		else
  			format.html { redirect_to home_index_url, alert:"Your post was not processed. Try again!" }
  			format.json do 
  				render json: { alert:"Your post was not processed. Try again!", operation_status: 1 }
  			end
  		end
  	end
  end

  def update
  end

  def destroy
    
  end
end
