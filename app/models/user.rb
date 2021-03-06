class User < ApplicationRecord
  include BCrypt

  def password
  @password ||= Password.new(password_hash)
end

def password=(new_password)
  @password = Password.create(new_password)
  self.password_hash = @password
end

  attr_accessor :password
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create


  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
      name: auth_hash.info.nickname,
      profile_image: auth_hash.info.image,
      token: auth_hash.credentials.token,
      secret: auth_hash.credentials.secret
    )
    user
  end

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, uniqueness: true
  # validates :phone_number, uniqueness: true

  belongs_to :schedules
  has_many :services, through: :appointments
  mount_uploader :avatar, AvatarUploader

  has_many :barbers, class_name: "User", foreign_key: 'client_id', through: :appointments
  has_many :clients, class_name: "User", foreign_key: 'barber_id', through: :appointments

  has_many :appointments_as_client, class_name: "Appointment", foreign_key: 'client_id'
  has_many :appointments_as_barber, class_name: "Appointment", foreign_key: 'barber_id'

end
