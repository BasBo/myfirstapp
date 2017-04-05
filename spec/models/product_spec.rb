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

	# Specs of product model validations
	# Spec of validates :presence
	context "All input fields are filled in" do
		before do
			@product = Product.new(name:"Testscooter", description:"For testing", image_url:"testscooter.jpg", colour: "test", price: 100)
		end

		it "Validation of presence should return no error" do
			@product.valid?
			@product.errors.full_messages.should_not include("can't be blank")
		end
	end 

	context "One input field is blank" do
		before do
			@product = Product.new(name:"", description:"For testing", image_url:"testscooter.jpg", colour: "test", price: 100)
		end

		it "Validation of presence should return error" do
			@product.valid?
			@product.errors.full_messages.should include("Name can't be blank")
		end
	end

	context "All input fields are blank" do
		before do
			@product = Product.new(name:"", description:"", image_url:"", colour:"", price:"")
		end

		it "Validation of presence should return errors" do
			@product.valid?
			@product.errors.full_messages.should include("Name can't be blank", "Description can't be blank", "Image url can't be blank", "Colour can't be blank", "Price can't be blank")
		end
	end
	
	# Spec of validates :format
	context "Entered image url contains .jpg extension" do
		before do
			@product = Product.new(name:"Testscooter", description:"For testing", image_url:"testscooter.jpg", colour: "test", price: 100)
		end

		it "Validation of format should return no error" do
			@product.valid?
			@product.errors[:image_url].should_not include("is invalid")
		end
	end

	context "Entered image url contains has missing .jpg extension" do
		before do
			@product = Product.new(name:"Testscooter", description:"For testing", image_url:"testscooter", colour: "test", price: 100)
		end

		it "Validation of format should return error" do
			@product.valid?
			@product.errors[:image_url].should include("is invalid")
		end
	end
	# Spec of validates :numericality
	context "Entered price is an integer" do
		before do
			@product = Product.new(name:"Testscooter", description:"For testing", image_url:"testscooter.jpg", colour: "test", price: 100)
		end

		it "Validation of numericality should return no error" do
			@product.valid?
			@product.errors[:price].should_not include("is not a number")
		end
	end	
	context "Entered price is not an integer" do
		before do
			@product = Product.new(name:"Testscooter", description:"For testing", image_url:"testscooter.jpg", colour: "test", price: "one hundred")
		end

		it "Validation of numericality should return error" do
			@product.valid?
			@product.errors[:price].should include("is not a number")
		end
	end
	context "Entered price is greater than zero" do
		before do
			@product = Product.new(name:"Testscooter", description:"For testing", image_url:"testscooter.jpg", colour: "test", price: 100)
		end

		it "Validation of numericality should return no error" do
			@product.valid?
			@product.errors[:price].should_not include("must be greater than 0")
		end
	end		
	context "Entered price is equal to zero" do
		before do
			@product = Product.new(name:"Testscooter", description:"For testing", image_url:"testscooter.jpg", colour: "test", price: 0)
		end

		it "Validation of numericality should return error" do
			@product.valid?
			@product.errors[:price].should include("must be greater than 0")
		end
	end		
end