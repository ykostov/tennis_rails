class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :players_in_tour, dependent: :destroy
  has_many :gladiators, through: :players_in_tour

  attr_accessor :points
end
