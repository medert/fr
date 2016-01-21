                                                                               class User < ActiveRecord::Base
  has_many :trips, class_name: "Trip",
                    foreign_key: "driver_id"
  has_many :reviews, class_name: "Review",
                    foreign_key: "rider_id"
  has_many :riders, through: :reviews, class_name: "Trip"
  has_many :reviews_on_self, through: :trips, class_name: "Review"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :gender, presence: true
  validates :address, presence: true
  validates :town, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :d_lisence, presence: true
  validates :phone, presence: true
  validates :email, presence: true
end
