class StaticPagesController < ApplicationController
  def index 
  end

  def landing_page
  	@products = Product.limit(5)
  	@featured_product = Product.first
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@name, @email, @message).deliver_now  
  end

end
