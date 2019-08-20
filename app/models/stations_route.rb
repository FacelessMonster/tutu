class StationsRoute < ApplicationRecord
  include RailsSortable::Model
  set_sortable :position
  belongs_to :railway_station
  belongs_to :route
end
