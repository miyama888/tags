class TagsController < ApplicationController
	def new
		@tag = Tag.new
	end

	def create
		@tag = Tag.new(tag_params)
		@tag.user_id =current_user.id
	  	@user =current_user
	    @tags =Tag.all
	  	if @tag.save
	      redirect_to root_path(@tag)
	    else
	      render :index
	    end
	end

	def index
	end

	private

	def tag_params
		params.require(:tag).permit(:title, :body)
	end
end
