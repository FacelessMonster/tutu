class Train < ApplicationRecord
  belongs_to :route, optional: true
  has_many :tickets
  has_many :carriages

  validates :number, presence: true, uniqueness: true
end