class AddNumberToCarriages < ActiveRecord::Migration[5.2]
  def change
    add_column :carriages, :number, :integer
  end
end
