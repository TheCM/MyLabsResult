class CreateTypeOfExaminations < ActiveRecord::Migration
  def change
    create_table :type_of_examinations do |t|
      t.string :examination, null: false

      t.timestamps null: false
    end
  end
end
