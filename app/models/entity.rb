# frozen_string_literal: true

class Entity < ApplicationRecord
  belongs_to :user
  has_many :entity_groups
end
