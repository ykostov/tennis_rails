class Gladiator < ApplicationRecord
  belongs_to :admin
  has_many :players_in_tour
  has_many :players, through: :players_in_tour

  def status
    return 'В игра....' if start_date == Date.today
    return 'Завършил'   if start_date < Date.today
    return 'Предстоящ'  if start_date > Date.today
  end
end
