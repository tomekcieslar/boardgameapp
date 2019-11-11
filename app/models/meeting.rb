class Meeting < ApplicationRecord
  belongs_to :game
  has_and_belongs_to_many :users

  enum status: {
    not_confirmed: 'not confirmed',
    confirmed: 'confirmed',
    ongoing: 'ongoing',
    finished: 'finished'
  }
end
