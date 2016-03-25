class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  mount_uploader :photo, PhotoUploader

  has_many :trips, dependent: :destroy, class_name: "Booking", foreign_key: "visitor_id"
  has_many :requests, dependent: :destroy, class_name: "Booking", foreign_key: "guide_id"
  has_many :tours, dependent: :destroy

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  # validates :first_name, :last_name, presence: true
  # validates :phone, presence: true
  # validates :bio, presence: true, length: {maximum: 200}
  # validates :hour_rate, numericality: { only_integer: true }
  # validates :birthday, presence: true
  # validates :street, presence: true
  # validates :zipcode, presence: true
  # validates :city, presence: true
end
