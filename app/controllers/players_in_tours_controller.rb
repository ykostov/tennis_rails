class PlayersInToursController < ApplicationController
  before_action :authenticate_admin!

  def update
    tour = Gladiator.find_by(id: params.dig('player', 'tour_id'))
    player = Player.find_by(id: params.dig('player', 'player_id'))
    points = params.dig('player', 'points') || 0
    if params.dig('player', 'enrolled') == '1'
      PlayersInTour.find_or_create_by!(
        gladiator: tour,
        player:    player
      ) do |entity|
        entity.points = points
      end
    else
      PlayersInTour.where(gladiator: tour, player:player).destroy_all
    end
  end
end
