class Ticket < ApplicationRecord
  belongs_to :carriage, class_name: "Carriage", foreign_key: "carriage_id"
  belongs_to :user
  belongs_to :train
  belongs_to :start_station, class_name: "RailwayStation", foreign_key: "start_station_id"
  belongs_to :end_station, class_name: "RailwayStation", foreign_key: "end_station_id"
  validates :passport, :person, presence: true
  
  after_create :send_notification
  
  def send_notification
    TicketMailer.buy_ticket(self.user, self).deliver_now
  end
end
