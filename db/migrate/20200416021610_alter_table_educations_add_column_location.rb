class AlterTableEducationsAddColumnLocation < ActiveRecord::Migration[5.2]
  def change
    change_table :educations do |t|
      t.string :location, limit: 127
    end
  end
end
