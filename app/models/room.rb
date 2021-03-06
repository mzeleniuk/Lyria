class Room < ApplicationRecord
  belongs_to :user

  has_many :messages, dependent: :destroy

  validates :title, presence: true, length: {maximum: 100}
end
