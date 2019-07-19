class AddCarriageIdToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :carriage_id, :integer
  end
end
