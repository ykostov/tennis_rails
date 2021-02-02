class PlayersInTour < ApplicationRecord
  belongs_to :player
  belongs_to :gladiator
end
