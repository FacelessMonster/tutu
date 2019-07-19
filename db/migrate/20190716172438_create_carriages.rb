class CreateCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :carriages do |t|
      t.string :type
      t.integer :seats
      t.integer :train_id
    end
  end
end
