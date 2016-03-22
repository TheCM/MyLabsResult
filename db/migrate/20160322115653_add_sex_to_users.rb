class AddSexToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sex, :string, limit: 1
  end
end
