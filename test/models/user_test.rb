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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
