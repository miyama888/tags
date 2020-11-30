class TagsController < ApplicationController

	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def new
		@tag = Tag.new
	end

	def create
		@tag = Tag.new(tag_params)
		@tag.user_id =current_user.id
	  	@user =current_user
	    @tags =Tag.all
	  	if @tag.save
	      redirect_to tag_path(@tag)
	    else
	      render :index
	    end
	end

	def edit
		@tag = Tag.find_by(id: params[:id])
	end

	def update
		@tag = Tag.find_by(id: params[:id])
		if @tag.update(tag_params)
			redirect_to tag_path(@tag)
		else
			render :edit
		end
	end

	def destroy
		tag = Tag.find(params[:id])
		tag.destroy
		redirect_to root_path(tag)
	end


	private

	def tag_params
		params.require(:tag).permit(:title, :body)
	end
end
