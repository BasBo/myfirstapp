require 'rails_helper'				# rails_helper.rb file contains the necessary configuration for running RSpec tests

describe Product do					#describe block (tells RSpec what we want to test, in this case it's the Model Product)
	context "when the product has comments" do
		before do
			#@product = Product.create!(name: "race bike")
			@product = FactoryGirl.create(:product)
			#@user = User.create!(email: "user@test.de", password: "testtt")
			@user = FactoryGirl.create(:user, :first, :second)
			#@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
			#@product.comments.create!(rating: 3, user: @user, body: "Average bike!")
			#@product.comments.create!(rating: 5, user: @user, body: "Awesome bike!")
			@comments = FactoryGirl.create(:comment, user: @user, product: @product)
			@comments = FactoryGirl.create(:comment, user: @user, product: @product)
			@comments = FactoryGirl.create(:comment, user: @user, product: @product)
			Product.new(description: "Nice bike")
		end
		
		it "returns the average rating off all comments" do
			expect(@product.average_rating).to eq 2
		end

		it "is not valid" do
			expect(Product.new(description: "Nice bike")).not_to be_valid
		end
	end
end