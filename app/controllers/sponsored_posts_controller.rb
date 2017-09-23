class SponsoredPostsController < ApplicationController
  def show
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored_post = SponsoredPost.new
  end

  def edit
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def create
    # #9
    @sponsored_post = SponsoredPost.new
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @topic = Topic.find(params[:topic_id])
    # #35
    @sponsored_post.topic = @topic
   
    # #10
    if @sponsored_post.save
    # #11
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @sponsored_post]
    else
    # #12
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def destroy
    @sponsored_post = SponsoredPost.find(params[:id])

    # #8
    if @sponsored_post.destroy
      flash[:notice] = "\"#{@sponsored_post.title}\" was deleted successfully"
      redirect_to @sponsored_post.topic
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end





end


