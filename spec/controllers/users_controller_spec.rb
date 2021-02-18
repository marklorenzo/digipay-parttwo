require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:valid_attributes) {
      {
        name: 'John Smith',
        email: 'John Smith'
      }
    }
     let(:invalid_attributes) {
      {
        name: '',
        email: 'John Smith'
      }
    }   
  describe '#create' do
    context 'the parameter "user[name]" is not blank' do
        it 'create new user' do
          post :create, params: {user: valid_attributes}
          expect(User.where(name: 'John Smith', email: 'John Smith')).to be_present
        end      
        it 'render an empty response' do
          post :create, params: {user: valid_attributes}
          expect(response.body).to eq('')
        end      
        it 'render a response with status 200' do
          post :create, params: {user: valid_attributes}
          expect(response.status).to eq(200)
        end
    end    
    context 'the parameter "user[name]" is blank' do      
        it 'does not create new user' do
          post :create, params: {user: invalid_attributes}
          expect(JSON.parse(response.body)).to include('errors')
        end      
        it 'renders a json response' do
          post :create, params: {user: invalid_attributes}
          expect(JSON.parse(response.body)).to have_key('errors')
          response.header['Content-Type'].should include 'application/json'
        end      
        it 'render a response with status 422' do    
          post :create, params: {user: invalid_attributes}      
          expect(response.status).to eq(422)
        end      
        it 'render error message' do
          post :create, params: {user: invalid_attributes}
          expect(JSON.parse(response.body)).to eq({"errors"=>{"name"=>["can't be blank"]}})
        end
     end
  end
end
