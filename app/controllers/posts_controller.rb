class PostsController < ApplicationController
	before_action :authenticate

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to :root
		else
			render :new
		end
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to :root
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to :root
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end
end
