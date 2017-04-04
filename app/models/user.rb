class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :username, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive: false}
  validates :about_me, length: {maximum: 500}
end
