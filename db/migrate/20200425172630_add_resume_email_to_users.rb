class AddResumeEmailToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :resume_email, :string, limit: 255, after: :email
  end
end
