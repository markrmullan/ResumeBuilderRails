class CreateFeatureFlag < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_flags, id: false do |t|
      t.integer :id, null: false, primary_key: true

      t.string :name, null: false, limit: 127
      t.boolean :enabled, null: false, default: false

      t.timestamps null: false
    end

    add_index :feature_flags, :name, unique: true
  end
end
