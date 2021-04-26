class Driver < ApplicationRecord

  # model associations
  has_many :checkins, dependent: :destroy

  # validations
  validates_presence_of :name, :email
  validates :email, uniqueness: true
end
