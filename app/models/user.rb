class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :trips, dependent: :destroy, class_name: "Booking", foreign_key: "visitor_id"
  has_many :requests, dependent: :destroy, class_name: "Booking", foreign_key: "guide_id"

  has_many :tours, dependent: :destroy

  # validates :first_name, :last_name, presence: true
  # validates :phone, presence: true
  # validates :bio, presence: true, length: {maximum: 200}
  # validates :hour_rate, numericality: { only_integer: true }
  # validates :birthday, presence: true
  # validates :street, presence: true
  # validates :zipcode, presence: true
  # validates :city, presence: true
end
