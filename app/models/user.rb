# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  city                   :string(127)
#  email                  :string           default(""), not null, indexed
#  encrypted_password     :string           default(""), not null
#  first_name             :string(127)
#  is_admin               :boolean          default(FALSE), not null
#  job_title              :string(127)
#  last_name              :string(127)
#  phone_number           :string(127)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string           indexed
#  resume_email           :string(255)
#  state                  :string(127)
#  uuid                   :string(36)       not null, indexed
#  zip                    :string(127)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  include ApplicationHelper::UUID

  has_many :experiences

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   def as_json(options = {})
     super(except: [:id, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :is_admin])
   end
end
