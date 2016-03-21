class CreateResultsForUsers < ActiveRecord::Migration
  def change
    create_table :results_for_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :worker, index: true
      t.belongs_to :result, index: true

      t.timestamps null: false
    end
  end
end
