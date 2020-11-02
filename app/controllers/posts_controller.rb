class PostsController < ApplicationController 
    def show 
        @post = Post.find(params[:id])
        if params[:like]
            @post.likes +=1 
            @post.save
        end
        render :show 
    end 

    def new
        @post = Post.new 
        render :new 
    end

    def create 
        @post = Post.create(post_params)
        if post.valid?
            redirect_to post_path(@post)
        else 
            flash[:post_errors] = @post.errors.full_messages
            redirect_to new_post_path 
        end 

    end 

    def edit 
        @post = Post.find(params[:id])
        render :edit 
    end 

    private 

    def post_params
        params.require(:post).permit(:title,:content,:likes,:blogger_id,:destination_id)
    end 

end 