class AlterExperiencesAddColumnCity < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :experiences, :users

    change_table :experiences do |t|
      t.remove :user_id
      t.string :city, limit: 127
      t.integer :resume_id, null: false
      t.string :description, limit: 5000
    end
    
    add_foreign_key :experiences, :resumes
  end
end
