class PagesController < ApplicationController
  before_action :authenticate_admin!, except: [:help, :about, :home]

  def home
  end

  def about
  end

  def tour
  end

  def gladiator
  end

  def admin
  end

  def ranklist
  end

  def help
  end
end
