class CreateResultAttachments < ActiveRecord::Migration
  def change
    create_table :result_attachments do |t|
      t.integer :result_id
      t.string :avatar

      t.timestamps null: false
    end
  end
end
