require 'rails_helper'

RSpec.describe User, type: :model do
	subject {User.new}

	it "is not valid without a name" do
		expect(subject).not_to be_valid
	end
end
