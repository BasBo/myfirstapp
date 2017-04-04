class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments

	def highest_rating_comment		#Custom method
		comments.rating_desc.first
	end

	def lowest_rating_comment
		comments.rating_asc.first
	end

	def average_rating
	  comments.average(:rating).to_f
	end

	validates :name, :description, :colour, :image_url, :price,  :presence => true #Validation of user-entries in forms
	validates :image_url, :format => /.jpg/
	validates :price, :numericality => { :greater_than => 0}
end
