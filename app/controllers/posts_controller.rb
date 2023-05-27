class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :asc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create 
    @post = Post.new()
    @post.title = params['title']
    @post.text = params['text']
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    puts "in create title is #{params['title']} text is #{params['text']}"
    p @post
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
    # redirect_to "/users/#{current_user}/posts" 
    # return
  end
end
