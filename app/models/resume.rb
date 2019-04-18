# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  uuid       :string(36)       not null
#  user_id    :integer          not null
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resume < ApplicationRecord
  include ApplicationHelper::UUID

  belongs_to :user
  validates_presence_of :name
end
