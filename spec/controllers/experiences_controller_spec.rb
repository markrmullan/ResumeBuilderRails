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
             })

        expect(response.status).to eq(401)
      end

      it 'returns 400 when required parameters are missing' do
        sign_in Fixtures.test_user
        post('/experiences', params: {
               experience: {
                 company: '',
                 position: ''
               }
             })

        expect(response.status).to eq(400)
        response_payload = JSON.parse(response.body, object_class: OpenStruct)
        expect(response_payload.company).to include(Constants.CANT_BE_BLANK)
        expect(response_payload.position).to include(Constants.CANT_BE_BLANK)
      end

      it 'can create an experience from POST /experiences' do
        sign_in Fixtures.test_user
        post('/experiences', params: {
               experience: experience
             })

        assert response.successful?

        response_payload = JSON.parse(response.body, object_class: OpenStruct)

        expect(response_payload.company).to be_truthy
        expect(response_payload.position).to be_truthy
        expect(response_payload.created_at).to be_truthy
        expect(response_payload.updated_at).to be_truthy
      end
    end

    describe 'UPDATE' do
      it 'requires authentication' do
        sign_out :user
        put('/experiences/123', params: {
              experience: experience
            })

        expect(response.status).to eq(401)
      end

      it 'returns 404 when passed a uuid of an experience that does not exist' do
        sign_in Fixtures.test_user
        put("/experiences/#{Constants.NON_EXISTENT}", params: {
              experience: experience
            })

        expect(response.status).to eq(404)

        response_payload = JSON.parse(response.body, object_class: OpenStruct)
        expect(response_payload.message).to eq("Couldn't find Experience #{Constants.NON_EXISTENT}")
      end

      it 'prevents against IDOR' do
        sign_in Fixtures.test_user
        post('/experiences', params: {
               experience: experience
             })

        created = JSON.parse(response.body, object_class: OpenStruct)

        sign_in Fixtures.test_user_2

        put("/experiences/#{created.uuid}", params: {
              experience: {
                company: 'LinkedIn',
                position: 'Software Engineer'
              }
            })

        # user 2 should not have edit access to the resource created by user 1
        expect(response.status).to eq(404)
      end

      it 'can update the `company` and `position` params' do
        sign_in Fixtures.test_user
        post('/experiences', params: {
               experience: experience
             })

        created = JSON.parse(response.body, object_class: OpenStruct)

        COMPANY = 'LinkedIn'.freeze
        POSITION = 'Software Engineer'.freeze
        put("/experiences/#{created.uuid}", params: {
              experience: {
                company: COMPANY,
                position: POSITION
              }
            })

        assert response.successful?

        updated = JSON.parse(response.body, object_class: OpenStruct)
        expect(updated.company).to eq(COMPANY)
        expect(updated.position).to eq(POSITION)
      end
    end
  end

  describe 'GET operations' do
    describe 'GET /experiences' do
      it 'returns a list of experiences that belong to the logged in user' do
        sign_in Fixtures.test_user

        get('/experiences')
        assert response.successful?
        fetched = JSON.parse(response.body, object_class: OpenStruct)
        expect(fetched.length).to eq(0)

        post('/experiences', params: {
               experience: experience
             })

        get('/experiences')
        assert response.successful?
        fetched = JSON.parse(response.body, object_class: OpenStruct)
        expect(fetched.length).to eq(1)
      end
    end
  end
end
