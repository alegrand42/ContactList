class ContactsController < ApplicationController
	#before_filter :authenticate_user!
	#before_action :set_contact, only: [:show, :update, :destroy]

	# GET /contacts
	def index
		#@contact = Contact.new
		@contact = current_user.contacts.new
	end

	# POST /contacts
	def create
		#@contact = Contact.new(contact_params)
		@contact = current_user.contacts.new(contact_params)
		@contact.user_id = current_user.id
		if @contact.save
			redirect_to @contact
		else
			redirect_to 'show'
		end
	end

	# GET /contacts/:id
	def show
		if current_user.id == Contact.find(params[:id]).user_id
			@contact = Contact.find(params[:id])
		else
			redirect_to '#home'
		end
	end

	def search
=begin
		#@contacts = Contact.all
		@contacts = current_user.contacts.all
=end
		@keyword = ''
		if params[:search] and /^[\w ]+$/.match(params[:search])
			@keyword = params[:search]
		end
		#@con = Contact.search(title: @keyword).order("created_at DESC")
		@con = current_user.contacts.search(name: @keyword).order("created_at DESC")
		@contacts = []
		@con.each do |u|
			@contacts.push(u)
		end
	end

	# PUT /contacts/:id
	def update
		@contact.update(contact_params)
	end

	# DELETE /contacts/:id
	def destroy
		@contact.destroy
	end

	private

	def contact_params
		p = params.require(:contact).permit(:name, :email, :image)
		name = p[:name].downcase
		p[:name] = p[:name].capitalize
		return p
	end

	def set_contact
		@contact = Contact.find(params[:id])
	end
end
