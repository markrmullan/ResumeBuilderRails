require 'rails_helper'

describe 'Session APIs', type: :request do
  describe 'POST /users/sign_in' do
    it 'returns a 401 response code with invalid login' do
      post('/users/sign_in.json', params: {
             user: user(Faker::Internet.email, Faker::String.random(7))
           })

      expect(response.status).to eq(401)
      response_payload = JSON.parse(response.body, object_class: OpenStruct)
      expect(response_payload.error).to eq('Invalid Email or password.')
    end

    it 'should return the user object when login credentials are valid' do
      post('/users/sign_in.json', params: {
             user: user('user1@gmail.com', 'password123')
           })

      expect response.successful?
      expect(response.status).to eq(201)
      response_payload = JSON.parse(response.body, object_class: OpenStruct)
      expect(response_payload.uuid).to be_truthy
      expect(response_payload.email).to be_truthy
      expect(response_payload.created_at).to be_truthy
      expect(response_payload.updated_at).to be_truthy
    end
  end

  describe 'logout, DELETE /users/sign_out' do
    it 'accepts an empty request body and always returns 204' do
      2.times do
        delete('/users/sign_out')
        expect response.successful?
        expect(response.status).to eq(204)
      end
    end
  end
end
