class PostsController < ApplicationController

  def censor(posts)
    i = 1
    posts.each do |post|
      if i == 1 || i % 5 == 0
        post.title = "SPAM"
      end
      i = i+1
    end
  end

  def index
    # #11
    @posts = Post.all

    censor(@posts)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # #9
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
   
    # #10
    if @post.save
    # #11
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
    # #12
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
  end




end
