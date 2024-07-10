class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = current_user.posts.order(published_date: :desc)
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

    def update
	  @post = Post.find(params[:id])
	  
	  if @post.update(post_params)
	    if params[:post][:remove_image] == '1'
	      @post.image.purge  
	    end
	    if params[:post][:remove_video] == '1'
	      @post.video.purge  
	    end
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
    params.require(:post).permit(:title, :author, :content, :status, :creation_date, :published_date, :image, :video)
  end
end
