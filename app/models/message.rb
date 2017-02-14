class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates_presence_of :body, :user, :room

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
