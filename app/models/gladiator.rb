class Gladiator < ApplicationRecord
  belongs_to :admin

  def status
    return 'In progress...' if start_date == Date.today
    return 'Finished'       if start_date < Date.today
    return 'Upcoming'       if start_date > Date.today
 end
end
