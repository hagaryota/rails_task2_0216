class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def days
    (self.end_date - self.start_date).to_int / 86400
  end

  def totalprice
     self.days * self.persons.to_i * self.room.price
  end
end
