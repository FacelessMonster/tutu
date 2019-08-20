class Carriage < ApplicationRecord
  has_many :tickets
  belongs_to :train, class_name: "Train", foreign_key: "train_id"
  validates :type, format: { with: /\A(ComfortCarriage|EconomyCarriage)\Z/, message: "only allows letters" }
  validates :number, uniqueness: true
  before_save :set_number

  # scope :economy, -> { where(type: 'EconomyCarriage', seats: 54) }
  # scope :comfort, -> { where(type: 'ComfortCarriage', seats: 36) }

  def set_number
    self.number = (self.train.carriages.count.to_i) + 1
  end

end
