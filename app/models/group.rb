class Group < ApplicationRecord
  has_many :messages
  has_many :members
  has_many :users, through: :members
  validates :name, presence: true
  accepts_nested_attributes_for :users
end
