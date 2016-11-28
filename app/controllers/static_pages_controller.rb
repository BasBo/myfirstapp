class StaticPagesController < ApplicationController
  def index 
  end

  def landing_page
  	@products = Product.limit(5)
  	@featured_product = Product.first
  	@seeded_product = Product.find(15).name
  end
end
