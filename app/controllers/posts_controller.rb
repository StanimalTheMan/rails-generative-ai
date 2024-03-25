class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    # generate image URL using OpenAI API
    response = $client.images.generate(parameters: { prompt: @post.title, size: "256x256" })
    img_url = response.dig("data", 0, "url")

    @post.img_url = img_url

    if @post.save
      redirect_to posts_path, notice: "Post was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)

      response = $client.images.generate(parameters: { prompt: @post.title, size: "256x256" })
      img_url = response.dig("data", 0, "url")

      @post.update(img_url: img_url)
      
      redirect_to posts_path, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully destroyed."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title)
  end
end
