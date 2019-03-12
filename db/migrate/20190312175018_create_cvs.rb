class CreateCvs < ActiveRecord::Migration[5.2]
  def change
    create_table :cvs, id: false do |t|
      t.integer :id, null: false, primary_key: true
      t.string :uuid, limit: 36, null: false
      t.integer :user_id, null: false

      t.string :name, limit: 255

      t.timestamps null: false
    end

    add_index :cvs, :uuid, unique: true
    add_foreign_key :cvs, :users
  end
end
