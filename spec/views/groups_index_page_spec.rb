require 'rails_helper'

RSpec.describe GroupsIndexPage, type: :feature do
  before :each do
    @user = User.create(
      name: 'Fernando',
      email: 'fernando@hello.com',
      password: '123456',
      password_confirmation: '123456'
    )
    @user.save!
    sign_in @user
    (1..3).each do |i|
      Group.create(
        name: "Group #{i}",
        icon: "group#{i}",
        user_id: @user.id
      )
    end
    visit groups_path
  end

  it 'should have a list of groups' do
    expect(page).to have_content 'Group 1'
    expect(page).to have_content 'Group 2'
    expect(page).to have_content 'Group 3'
  end

  it 'should have a link to create a new group' do
    expect(page).to have_link 'New Group'
  end

  it 'should have a link to edit a group' do
    expect(page).to have_link 'Edit'
  end
end
