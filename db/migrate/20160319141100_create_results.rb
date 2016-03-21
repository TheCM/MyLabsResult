class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :type_of_tissue_id, null: false
      t.integer :type_of_examination_id, null: false

      t.text :description, null: false, default: ""
      t.string :diagnosis, null: true, default: ""

      t.timestamps null: false
    end
    add_foreign_key :results, :type_of_examinations
    add_foreign_key :results, :type_of_tissues
  end
end
