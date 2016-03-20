class CreateTypeOfTissues < ActiveRecord::Migration
  def change
    create_table :type_of_tissues do |t|
      t.string :tissue, null: false
      t.string :translation, null: false

      t.timestamps null: false
    end
  end
end
