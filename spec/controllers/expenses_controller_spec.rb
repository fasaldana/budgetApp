# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpensesController, type: :request do
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
    @expense = Expense.create(
      name: 'Gas',
      amount: '100',
      user_id: @user.id
    )
    GroupExpense.create(
      group_id: @group.id,
      expense_id: @expense.id
    )
  end

  describe 'GET #index' do
    before { get group_expenses_path(@group) }
    it 'should return a success response' do
      get group_expenses_path(@group)
      expect(response).to be_success
    end

    it 'should return a 200 response' do
      get group_expenses_path(@group)
      expect(response).to have_http_status '200'
    end

    it 'should return a list of expenses' do
      get group_expenses_path(@group)
      expect(response.body).to include @expense.name
    end
  end
end
