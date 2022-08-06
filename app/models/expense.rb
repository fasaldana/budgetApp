# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :user
  has_many :group_expense, dependent: :destroy
  has_many :groups, through: :group_expense
end
