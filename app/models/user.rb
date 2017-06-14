class User < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true

  belongs_to :schedules
  has_many :services, through: :appointments
  mount_uploader :avatar, AvatarUploader

  has_many :barbers, class_name: "User", foreign_key: 'client_id', through: :appointments
  has_many :clients, class_name: "User", foreign_key: 'barber_id', through: :appointments

  has_many :appointments_as_client, class_name: "Appointment", foreign_key: 'client_id'
  has_many :appointments_as_barber, class_name: "Appointment", foreign_key: 'barber_id'

end
