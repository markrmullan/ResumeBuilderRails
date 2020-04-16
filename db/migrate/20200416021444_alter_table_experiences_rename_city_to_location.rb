class AlterTableExperiencesRenameCityToLocation < ActiveRecord::Migration[5.2]
  def change
    change_table :experiences do |t|
      t.rename :city, :location
    end
  end
end
