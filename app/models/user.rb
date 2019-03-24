# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  uuid                   :string(36)       not null
#  first_name             :string(127)
#  last_name              :string(127)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  before_save :underscore
  attr_accessor :firstName, :lastName, :phoneNumber

  include ApplicationHelper::UUID

  has_many :experiences

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private
  def underscore
    self.first_name = firstName
    self.last_name = lastName
    self.phone_number = phoneNumber
  end
end
