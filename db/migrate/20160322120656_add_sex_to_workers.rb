class AddSexToWorkers < ActiveRecord::Migration
  def change
    add_column :workers, :sex, :string, limit: 1
  end
end
