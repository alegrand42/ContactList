require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the StaticPagesHelper. For example:
#
# describe StaticPagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe StaticPagesHelper, type: :helper do
	it "should have the h1 'Welcome to the Contact App'" do
		visit '/static_pages/home'
		within '#content' do
			expect(find('h1')).to have_content('Welcome to the Contact App')	
		end	
	end
end
