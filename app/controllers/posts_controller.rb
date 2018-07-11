class PostsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  def index
    @posts = Post.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
