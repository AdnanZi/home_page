class HomeController < ApplicationController
	before_action :authenticate, only: [:editAbout, :saveAbout, :editContact, :saveContact]

	def index
		@posts = Post.order(created_at: :desc)
	end

	def about
		@myInfo = MyInfo.find_by(name: "About")
	end

	def editAbout
		@myInfo = MyInfo.find_by(name: "About") || MyInfo.new
	end

	def saveAbout
		if saveInfo?
			redirect_to home_about_path
		else
			render :editAbout
		end
	end

	def contact
		@myInfo = MyInfo.find_by(name: "Contact")
	end

	def editContact
		@myInfo = MyInfo.find_by(name: "Contact") || MyInfo.new
	end

	def saveContact
		if saveInfo?
			redirect_to home_contact_path
		else
			render :editContact
		end
	end

	def logIn
		if (session[:authenticated] != true)
				redirect_to :root if authenticate === true
		else
			redirect_to :root
		end
	end

	private 
		def myinfo_params
			params.require(:my_info).permit(:name, :content)
		end

		def saveInfo?
			@myInfo = MyInfo.find_by(name: myinfo_params[:name])
			@edited = false;

			if @myInfo then
				@edited = @myInfo.update(myinfo_params)
			else
				@myInfo = MyInfo.new(myinfo_params)
				@edited = @myInfo.save
			end
		end
end
