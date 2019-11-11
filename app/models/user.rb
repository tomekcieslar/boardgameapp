class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :games
  has_and_belongs_to_many :meetings

  has_one_attached :avatar

  def full_name
    "#{first_name}  #{last_name}"
  end

  def full_username
      "#{first_name} '#{username}' #{last_name}"
  end
end
