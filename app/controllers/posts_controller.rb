class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user_giving.posts.build(post_params)
    url = params[:post][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    url = params[:post][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url
    if @post.save
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to giving_path(@post.giving)
  end

  private
   def post_params
     params.require(:post).permit(:content, :youtube_url, :name )
   end
end
