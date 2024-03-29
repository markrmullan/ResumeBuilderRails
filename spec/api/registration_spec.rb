require 'rails_helper'

$first_name = 'John'
$last_name = 'Doe'

def user(email = Faker::Internet.email, password = Faker::String.random(9), phone_number = Faker::PhoneNumber.cell_phone)
  {
    email: email,
    first_name: $first_name,
    last_name: $last_name,
    password: password,
    phone_number: phone_number
  }
end

describe 'User registration API: POST /users', type: :request do
  it 'returns user data on success' do
    post('/users', params: {
           user: user
         })

    assert response.successful?

    response_payload = JSON.parse(response.body, object_class: OpenStruct)

    expect(response_payload.uuid).to be_truthy
    expect(response_payload.email).to be_truthy
    expect(response_payload.firstName).to eq($first_name)
    expect(response_payload.lastName).to eq($last_name)
    expect(response_payload.phoneNumber).to be_truthy
    expect(response_payload.createdAt).to be_truthy
    expect(response_payload.updatedAt).to be_truthy
  end

  it 'does not allow a user to signup twice', type: :request do
    one_user = user
    post('/users', params: {
           user: one_user
         })

    assert response.successful?

    post('/users', params: {
           user: one_user
         })

    expect(response.status).to eq(422)

    response_payload = JSON.parse(response.body, object_class: OpenStruct)
    expect(response_payload.errors.email.first).to eq('User has already been taken')
  end

  it 'requires a password with at least 8 digits', type: :request do
    post('/users', params: {
           user: user(Faker::Internet.email, Faker::String.random(7))
         })

    expect(response.status).to eq(422)
    response_payload = JSON.parse(response.body, object_class: OpenStruct)
    expect(response_payload.errors.password).to include('is too short (minimum is 8 characters)')
  end

  it 'requires a valid email (default Devise email regex validation just requires an @ symbol to be present)' do
    post('/users', params: {
           user: user('invalidemail.com')
         })

    expect(response.status).to eq(422)
    response_payload = JSON.parse(response.body, object_class: OpenStruct)
    expect(response_payload.errors.email).to include('is invalid')
  end
end
