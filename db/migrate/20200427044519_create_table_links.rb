class CreateTableLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links, id: false do |t|
      t.integer :id, null: false, primary_key: true
      t.string :uuid, limit: 36, null: false
      t.integer :resume_id, null: false
      t.string :url, limit: 255

      t.timestamps null: false
    end

    add_index :links, :uuid, unique: true
    add_foreign_key :links, :resumes
  end
end
