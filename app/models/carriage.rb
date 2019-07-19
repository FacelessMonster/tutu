class Carriage < ApplicationRecord
  has_many :tickets
  belongs_to :train, class_name: "Train", foreign_key: "train_id"
  validates :type, format: { with: /\A(ComfortCarriage|EconomyCarriage)\Z/, message: "only allows letters" }


end
