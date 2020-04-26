# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  city                   :string(127)
#  email                  :string           default(""), not null, indexed
#  encrypted_password     :string           default(""), not null
#  first_name             :string(127)
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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
