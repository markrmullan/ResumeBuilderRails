# == Schema Information
#
# Table name: experiences
#
#  id         :integer          not null, primary key
#  uuid       :string(36)       not null
#  user_id    :integer          not null
#  company    :string(255)
#  position   :string(255)
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Experience < ApplicationRecord
  include ApplicationHelper::UUID

  belongs_to :user
  validates_presence_of :company, :position
end
