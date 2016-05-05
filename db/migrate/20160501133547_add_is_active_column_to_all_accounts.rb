class AddIsActiveColumnToAllAccounts < ActiveRecord::Migration
  def change
    add_column :users, :is_active, :boolean, default: true, null: false
    add_column :workers, :is_active, :boolean, default: true, null: false
    add_column :labs, :is_active, :boolean, default: true, null: false
  end
end
