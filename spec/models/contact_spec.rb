require 'rails_helper'

RSpec.describe Contact, type: :model do
	subject {Contact.new}

	it "is not valid without a name" do
		expect(subject).not_to be_valid
	end

	it "is not valid with a name longer then 100 symbols" do
		subject.name = 'a' * 101
		subject.user_id = 2
		subject.email = 'foo@bar.com'
		expect(subject).not_to be_valid
	end

	it "is valid with proper data" do
		subject.name = 'a' * 50
		subject.user_id = 2
		subject.email = 'foo@bar.com'
		subject.image = File.new("#{Rails.root}/spec/support/right.png")
		expect(subject).to be_valid
	end

end
