require 'constants'
require 'fixtures'
require 'rails_helper'

def experience(company = Faker::Company.name, position = Faker::Company.profession)
  {
    company: company,
    position: position
  }
end

describe ExperiencesController, type: :request do
  describe 'CRUD operations' do
    describe 'CREATE' do
      it 'returns 401 for unauthenticated clients' do
        sign_out :user
        post('/experiences', params: {
               experience: experience
             }, headers: { 'ACCEPT' => 'application/json' })

        expect(response.status).to eq(401)
      end

      it 'returns 400 when required parameters are missing' do
        sign_in Fixtures.test_user
        post('/experiences', params: {
               experience: {
                 company: '',
                 position: ''
               }
             }, headers: { 'ACCEPT' => 'application/json' })

        expect(response.status).to eq(400)
        response_payload = JSON.parse(response.body, object_class: OpenStruct)
        expect(response_payload.company).to include(Constants.CANT_BE_BLANK)
        expect(response_payload.position).to include(Constants.CANT_BE_BLANK)
      end

      it 'can create an experience from POST /experiences' do
        sign_in Fixtures.test_user
        post('/experiences', params: {
               experience: experience
             }, headers: { 'ACCEPT' => 'application/json' })

        expect(response.status).to eq(200)

        response_payload = JSON.parse(response.body, object_class: OpenStruct)

        expect(response_payload.company).to be_truthy
        expect(response_payload.position).to be_truthy
        expect(response_payload.created_at).to be_truthy
        expect(response_payload.updated_at).to be_truthy
      end
    end
  end
end
