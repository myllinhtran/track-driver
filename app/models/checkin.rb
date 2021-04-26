class Checkin < ApplicationRecord

  # model association
  belongs_to :driver

  # validations
  validates_presence_of :hours, :driver_id

end
