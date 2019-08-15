class AddColumnsToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :person, :string
    add_column :tickets, :passport, :string
    add_column :tickets, :user_id, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
