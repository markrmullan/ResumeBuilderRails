class AlterTableEducationsAddColumnGpa < ActiveRecord::Migration[5.2]
  def change
    remove_column :educations, :location, :string

    add_column :educations, :gpa, :string, limit: 127
  end
end
