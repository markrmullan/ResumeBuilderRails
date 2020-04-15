class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations, id: false do |t|
      t.integer :id, null: false, primary_key: true
      t.string :uuid, limit: 36, null: false
      t.integer :resume_id, null: false
      t.string :school, limit: 255
      t.string :degree, limit: 255
      t.string :description, limit: 5000

      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end

    add_index :educations, :uuid, unique: true
    add_foreign_key :educations, :resumes
  end
end
