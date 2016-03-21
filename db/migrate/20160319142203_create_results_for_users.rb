class CreateResultsForUsers < ActiveRecord::Migration
  def change
    create_table :results_for_users do |t|
      t.integer :user_id, null: false
      t.integer :worker_id, null: false
      t.integer :result_id, null: false

      t.timestamps null: false
    end
  end
end
