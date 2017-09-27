class Contact < ApplicationRecord
	validates :name, presence: true
	validates :name, length: {maximum: 100}
	validates :user_id, presence: true
	validates :email, presence: true

	#belongs_to :user, :as => :created_by
	belongs_to :user
end
