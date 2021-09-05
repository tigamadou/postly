class PostsController < ApplicationController
    before_action :set_post, only: %i[ show edit update destroy ]

    def index
        @posts = Post.all
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
    
        respond_to do |format|
          if @post.save
            format.html { redirect_to posts_path, notice: "Post was successfully created." }
            format.json { render :show, status: :created, location: @post }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
    end

    private
    def set_post
      @blog = Blog.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content)
    end
end
