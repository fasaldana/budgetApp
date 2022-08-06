# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user
  has_many :group_expense, dependent: :destroy
  has_many :expenses, through: :group_expense

  def total_amount
    expenses.sum(:amount)
  end
end
