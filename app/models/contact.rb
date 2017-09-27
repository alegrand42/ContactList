class Contact < ApplicationRecord
	validates :name, presence: true
	validates :name, length: {maximum: 100}
	validates :user_id, presence: true
	validates :email, presence: true

	belongs_to :user

	if ENV["CONTACTS_PATH"]
		has_attached_file :image,  :path => "#{ENV["CONTACTS_PATH"]}/:year/:month/:day/:id/image/:filename", styles: { thumb: "120x120>" }, :url => "#{ENV["CONTACTS_PATH"]}/:year/:month/:day/:id/image/:filename", default_url: "/images/:style/missing.png"
	else
		has_attached_file :image, :path => "#{Rails.root}/public/system/:year/:month/:day/:id/image/:filename", styles: { thumb: "300x300>" }, :url => "/system/:year/:month/:day/:id/image/:filename", default_url: "/images/:style/missing.png"
	end

	Paperclip.interpolates :year do |attachment, style|
		attachment.instance.created_at.year
	end
	Paperclip.interpolates :month do |attachment, style|
		attachment.instance.created_at.month
	end
	Paperclip.interpolates :day do |attachment, style|
		attachment.instance.created_at.day
	end

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def get_contact_root
		if ENV["CONTACTS_PATH"]
			return ENV["CONTACTS_PATH"]
		end
		return "#{Rails.root}/public/system/#{created_at.year}/#{created_at.month}/#{created_at.day}/#{id}/image"
	end

	def get_thumb_page
		"#{get_contact_root}/#{image_file_name}"
	end


	def self.search(query_hash)
		result = all
		result = result.where("name like ?", "%#{query_hash[:name]}%") if query_hash[:name]
		result
	end
end
