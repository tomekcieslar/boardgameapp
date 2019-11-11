class Game < ApplicationRecord
  has_and_belongs_to_many :users

  has_one_attached :thumbnail
  has_one_attached :image

  validates :bgg_id, uniqueness: true

  def real_time
    if max_time == min_time
      "around #{max_time} min"
    else
      "#{@meeting.game.min_time} - #{@meeting.game.max_time} min"
    end
  end
end
