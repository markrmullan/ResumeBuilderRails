require 'constants'
require 'fixtures'
require 'rails_helper'

RSpec.describe ResumesController, type: :request do
  before(:each) do
    sign_in Fixtures.test_user
  end

  describe 'CRUD Operations' do
    describe 'CREATE' do
      it 'requires a `name` in the request body' do
        post('/resumes', params: { resume: { name: '' } })
        assert response.bad_request?
        payload = JSON.parse(response.body, object_class: OpenStruct)
        expect(payload.name).to include(Constants.CANT_BE_BLANK)
      end

      it 'returns the record once created' do
        post('/resumes', params: { resume: { name: 'My first resume' } })
        assert response.successful?
        payload = JSON.parse(response.body, object_class: OpenStruct)

        expect(payload.uuid).to be_truthy
        expect(payload.createdAt).to be_truthy
        expect(payload.updatedAt).to be_truthy
      end
    end

    describe 'UPDATE' do
      it 'returns 404 if attempting to update a resume that cannot be found by UUID' do
        patch('/resumes/123123', params: { resume: { name: 'resume for Customer Service positions' } })
        assert response.not_found?
      end

      it 'allows a user to update a resume object' do
        post('/resumes', params: { resume: { name: 'My first resume' } })
        created = JSON.parse(response.body, object_class: OpenStruct)

        new_name = 'resume for Customer Service positions'
        patch("/resumes/#{created.uuid}", params: { resume: { name: new_name } })
        assert response.successful?
        updated = JSON.parse(response.body, object_class: OpenStruct)

        expect(created.uuid).to eq(updated.uuid)
        expect(updated.name).to eq(new_name)
      end
    end
  end

  describe 'GET operations' do
    describe 'INDEX' do
      it 'returns a list of resumes that belong to the signed in user' do
        get('/resumes')
        assert response.successful?
        resp = JSON.parse(response.body, object_class: OpenStruct)

        expect(resp.length).to eq(0)
        post('/resumes', params: { resume: { name: 'My first resume' } })

        get('/resumes')
        resp = JSON.parse(response.body, object_class: OpenStruct)
        expect(resp.length).to eq(1)
      end
    end
  end
end
