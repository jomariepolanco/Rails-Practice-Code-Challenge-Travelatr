class BloggersController < ApplicationController

    def new
        @blogger = Blogger.new 
        render :new
    end

    def show 
        @blogger = Blogger.find(params[:id])
        render :show
    end 


    def create
        @blogger = Blogger.create(blogger_params)
        if @blogger.valid?
            redirect_to blogger_path(@blogger)
        else
            flash[:blogger_errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end

    private 

    def blogger_params
        params.require(:blogger).permit(:name,:bio,:age)
    end 
end