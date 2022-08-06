# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GroupsController, type: :request do
  before :each do
    @user = User.create(
      name: 'Fernando',
      email: 'fernando@hello.com',
      password: '123456',
      password_confirmation: '123456'
    )
    sign_in @user
    @group = Group.create(
      name: 'Ruby',
      icon: 'ruby',
      user_id: @user.id
    )
  end

  describe 'GET #index' do
    before { get groups_path }
    it 'should return a success response' do
      get groups_path
      expect(response).to be_success
    end

    it 'should return a 200 response' do
      get groups_path
      expect(response).to have_http_status '200'
    end

    it 'should return a list of groups' do
      get groups_path
      expect(response.body).to include @group.name
    end
  end
end
