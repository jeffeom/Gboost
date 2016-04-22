class PostsController < ApplicationController
  before_action(:find_post, {only: [:show, :edit, :update, :destroy]})
  def index
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to(post_path(@post), notice: "Post Created!")
    else
      render :new, alert: "An Error occured while creating the post"
    end
  end

  def edit
  end

  def update
    if @post.update(event_params)
      redirect_to post_path(@post), notice: "Post Updated!"
    else
      render :edit, alert: "An Error occured editing the event"
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = "Post Deleted Successfully"
    redirect_to posts_path
  end

  private

  def post_params
    post_params = params.require(:post).permit([:title, :location, :description])
  end

  def find_post
    @post = Post.find params[:id]
  end
end
