class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.unscope(:order).where(to_be_approved: false).order('id DESC')
  end

  def show
    @reviews = Review.where(post_id: @post.id)
    @unreviewed_posts = Post.where(reviewed: false).where.not(id: @post.id, user_id: current_user.id).limit(3)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    user = current_user
    @post = user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:problem, :code, :review_questions)
  end
end
