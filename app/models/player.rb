class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :players_in_tour, dependent: :destroy
  has_many :gladiators, through: :players_in_tour

  attr_accessor :points, :enrolled

  def enrolled_in?(tour)
    PlayersInTour.where(player: self, gladiator: tour).present?
  end

  def points_for(tour)
    PlayersInTour.find_by(player: self, gladiator: tour).points
  end
end
