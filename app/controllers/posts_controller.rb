class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    p = 'a'
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post =Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    redirect_to @post if @post.update(post_params)
    render 'edit'
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
    def find_post
      @post = Post.find(params[:id])
      render error if @post.blank?
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
