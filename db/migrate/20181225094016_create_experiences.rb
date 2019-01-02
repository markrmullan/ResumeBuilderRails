class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences, id: false do |t|
      t.integer :id, null: false, primary_key: true
      t.string :uuid, limit: 36, null: false
      t.integer :user_id, null: false
      t.string :company, limit: 255
      t.string :position, limit: 255

      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end

    add_index :experiences, :uuid, unique: true
    add_foreign_key :experiences, :users
  end
end
