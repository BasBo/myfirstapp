require 'rails_helper'

describe ProductsController, :type => :controller do
	before do
		@user = User.new(:email => "tony@test.de", :password => "Password", :password_confirmation => "Password")
		@user.save
		@product = Product.new(:name => "testscooter", :description => "fortesting", :colour => "testcoloured", :image_url => "testscooter.jpg", :price => 100)
		@product.save
		@admin = User.new(:email => "admin@test.de", :password => "Password", :password_confirmation => "Password", :admin => true)
		@admin.save
	end

	# Spec for index-route
	describe 'GET #index' do
		before do
			get :index
		end
		context 'User is logged in' do
			before do
				sign_in @user
			end
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

	# Spec for show-route
	describe 'GET #show' do
		before do
			get :show, id: @product.id
		end
		context 'User is logged in' do
			before do
				sign_in @user
			end
			it 'responds successfully with an HTTP 200 status code' do
				expect(response).to be_success
				expect(response).to have_http_status(200)
			end

			it 'renders the show template' do
				expect(response).to render_template('show')
			end
		end

		context 'User is logged out' do
			it 'responds successfully with an HTTP 200 status code' do
				expect(response).to be_success
				expect(response).to have_http_status(200)
			end

			it 'renders the show template' do
				expect(response).to render_template('show')
			end
		end
	end

	# Spec for edit-route
	describe 'GET #edit' do
		context 'User is logged in' do
			before do
				sign_in @user
				get :edit, id: @product.id
			end

			it 'renders the product overview' do
				expect(response).to redirect_to('/products')
			end
		end

		context 'Admin is logged in' do
			before do
				sign_in @admin
				get :edit, id: @product.id
			end

			it 'responds successfully with an HTTP 200 status code' do
				expect(response).to be_success
				expect(response).to have_http_status(200)
			end

			it 'renders the edit view' do
				expect(response).to render_template('edit')
			end
		end

		context 'User is logged out' do
			before do
				get :edit, id: @product.id
			end

			it 'renders the login template' do
				expect(response).to redirect_to('/login')
			end
		end
	end

	# Spec for new-route
	describe 'GET #new' do
		context 'User is logged in' do
			before do
				sign_in @user
				get :new
			end

			it 'renders the product overview' do
				expect(response).to redirect_to('/products')
			end
		end

		context 'Admin is logged in' do
			before do
				sign_in @admin
				get :new
			end

			it 'responds successfully with an HTTP 200 status code' do
				expect(response).to be_success
				expect(response).to have_http_status(200)
			end

			it 'renders the new view' do
				expect(response).to render_template('new')
			end
		end

		context 'User is logged out' do
			before do
				get :new
			end

			it 'renders the login template' do
				expect(response).to redirect_to('/login')
			end
		end
	end
end