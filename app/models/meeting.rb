class Meeting < ApplicationRecord
  validates :game_id, presence: true
  belongs_to :game
  has_and_belongs_to_many :users
  has_many :conversations

  enum status: {
    unconfirmed: 'unconfirmed',
    confirmed: 'confirmed',
    ongoing: 'ongoing',
    finished: 'finished'
  }

  def address
    "#{city}, #{street}"
  end
end
