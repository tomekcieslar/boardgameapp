class Game < ApplicationRecord
  has_and_belongs_to_many :users

  has_one_attached :thumbnail
  has_one_attached :image

  validates :bgg_id, uniqueness: true
end
