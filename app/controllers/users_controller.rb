class UsersController < ApplicationController
	def home
		@tags = Tag.all
	end
end
