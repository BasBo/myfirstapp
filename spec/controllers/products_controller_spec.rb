require 'rails_helper'

describe ProductsController, :type => :controller do
	before do
		@user = User.new(:email => "tony@test.de", :password => "Password", :password_confirmation => "Password")
	end

	describe 'GET #index' do
		before do
			get :index
		end
		context 'User is logged in' do
			it 'responds successfully with an HTTP 200 status code' do
				expect(response).to be_success
				expect(response).to have_http_status(200)
			end

			it 'renders the index template' do
				expect(response).to render_template('index')
			end
		end

		context 'User is logged out' do
			it 'responds successfully with an HTTP 200 status code' do
				expect(response).to be_success
				expect(response).to have_http_status(200)
			end

			it 'renders the index template' do
				expect(response).to render_template('index')
			end
		end
	end
end