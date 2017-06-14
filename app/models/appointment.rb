class Appointment < ApplicationRecord

  validates :date, presence: true
  validates :time, presence: true

  belongs_to :barber, class_name: "User", foreign_key: "barber_id"
  belongs_to :client, class_name: "User", foreign_key: "client_id", optional: true

end
