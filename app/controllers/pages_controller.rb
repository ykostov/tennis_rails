class PagesController < ApplicationController
  before_action :authenticate_admin!, except: [:help, :about, :home]

  def home
  end

  def about
  end

  def ranking

    @players = Player.all
    @gladiators = Gladiator.all

  end

end
