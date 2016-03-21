class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.belongs_to :type_of_tissue, index: true
      t.belongs_to :type_of_examination, index: true

      t.text :description, null: false, default: ""
      t.string :diagnosis, null: true, default: ""

      t.timestamps null: false
    end
  end
end
