require 'constants'
require 'fixtures'
require 'rails_helper'

RSpec.describe CvsController, type: :request do
  before(:each) do
    sign_in Fixtures.test_user
  end

  describe 'CRUD Operations' do
    describe 'CREATE' do
      it 'requires a `name` in the request body' do
        post('/cvs', params: { cv: { name: '' }})
        assert response.bad_request?
        payload = JSON.parse(response.body, object_class: OpenStruct)
        expect(payload.name).to include(Constants.CANT_BE_BLANK)
      end

      it 'returns the record once created' do
        post('/cvs', params: { cv: { name: 'My first CV' }})
        assert response.successful?
        payload = JSON.parse(response.body, object_class: OpenStruct)

        expect(payload.uuid).to be_truthy
        expect(payload.created_at).to be_truthy
        expect(payload.updated_at).to be_truthy
      end
    end

    describe 'UPDATE' do
      it 'returns 404 if attempting to update a CV that cannot be found by UUID' do
        patch('/cvs/123123', params: { cv: { name: 'CV for Customer Service positions' }})
        assert response.not_found?
      end

      it 'allows a user to update a CV object' do
        post('/cvs', params: { cv: { name: 'My first CV' }})
        created = JSON.parse(response.body, object_class: OpenStruct)

        new_name = 'CV for Customer Service positions'
        patch("/cvs/#{created.uuid}", params: { cv: { name: new_name }})
        assert response.successful?
        updated = JSON.parse(response.body, object_class: OpenStruct)

        expect(created.uuid).to eq(updated.uuid)
        expect(updated.name).to eq(new_name)
      end
    end
  end

  describe 'GET operations' do
    describe 'INDEX' do
      it 'returns a list of CVs that belong to the signed in user' do
        get('/cvs')
        assert response.successful?
        resp = JSON.parse(response.body, object_class: OpenStruct)

        expect(resp.length).to eq(0)
        post('/cvs', params: { cv: { name: 'My first CV' }})

        get('/cvs')
        resp = JSON.parse(response.body, object_class: OpenStruct)
        expect(resp.length).to eq(1)
      end
    end
  end
end
