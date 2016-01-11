class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # GET /posts/new
  def new
    @post = Post.new
    render json: @post
  end

  # GET /posts/1/edit
  def edit
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post
    else
      render_error @post.errors.full_messages
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render_error @post.errors.full_messages
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    render json: {success: true}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:name)
    end

    def render_error(errors, status = 422)
      render status: status, json: { errors:  errors }
    end
end
