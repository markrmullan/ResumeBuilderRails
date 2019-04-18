class AddFirstNameLastNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string, limit: 127, after: :uuid
    add_column :users, :last_name, :string, limit: 127, after: :first_name
  end
end
