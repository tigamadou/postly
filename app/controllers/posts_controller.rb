class PostsController < ApplicationController
    before_action :set_post, only: %i[ show edit update destroy ]

    def index
        @posts = Post.all
        @post = Post.new
    end

    def confirm
        @post = Post.new(post_params)
        render :new if @post.invalid?
    end

    def new
        @post = Post.new
      end

    def create
        @post = Post.new(post_params)
        if params[:back]
            render :new
        else
            respond_to do |format|
              if @post.save
                format.html { redirect_to posts_path, notice: "Post was successfully created." }
              else
                format.html { render :new, status: :unprocessable_entity }
              end
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
          if @post.update(post_params)
            format.html { redirect_to posts_path, notice: "Post was successfully updated." }
            
          else
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
    end
    def destroy
        @post.destroy
        respond_to do |format|
          format.html { redirect_to posts_path, notice: "Post was successfully deleted." }
          
        end
    end

    private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content)
    end
end
