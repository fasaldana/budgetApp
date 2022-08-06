# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.create(
      name: 'Fernando',
      email: 'fernando@hello.com',
      password: '123456',
      password_confirmation: '123456'
    )
    @group = Group.create(
      name: 'Ruby',
      icon: 'ruby',
      user_id: @user.id
    )
  end

  describe 'Group model' do
    it 'should be valid' do
      expect(@group).to be_valid
    end

    it 'should have a name' do
      @group.name = nil
      expect(@group).to_not be_valid
    end
  end
end
