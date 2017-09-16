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
  end

  def new
  end

  def edit
  end




end
