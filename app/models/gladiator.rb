class Gladiator < ApplicationRecord
  belongs_to :admin

  def status
    return 'В игра....' if start_date == Date.today
    return 'Завършил'       if start_date < Date.today
    return 'Предстоящ'       if start_date > Date.today
 end
end
