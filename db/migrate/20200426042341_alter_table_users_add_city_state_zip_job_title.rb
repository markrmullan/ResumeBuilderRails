class AlterTableUsersAddCityStateZipJobTitle < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :city, :string, limit: 127
    add_column :users, :state, :string, limit: 127
    add_column :users, :zip, :string, limit: 127
    add_column :users, :job_title, :string, limit: 127
  end
end
