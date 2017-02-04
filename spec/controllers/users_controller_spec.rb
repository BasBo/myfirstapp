require 'rails_helper'

describe UsersController, :type => :controller do

  let(:user) { User.create!(email: 'peter@example.com', password: '1234567890') }

  let(:user_two) { User.create!(email: 'john@example.com', password: '000000') }

  describe 'GET #show' do
     context 'User is logged in' do
     	before do
     		sign_in user	
     	end

     	it 'loads correct user details' do
     		get :show, id: user.id
     		expect(response).to have_http_status(200)
     		expect(assigns(:user)).to eq user
     	end

      it 'can not access show page of another user' do
        get :show, id: user.id
        expect(assigns(:user)).not_to eq user_two
      end  

     end

     context 'No user is logged in' do
       it 'redirects to login' do
         get :show, id: user.id
         expect(response).to redirect_to(root_path)
       end
     end
  end

end