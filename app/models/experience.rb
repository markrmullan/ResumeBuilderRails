# == Schema Information
#
# Table name: experiences
#
#  id          :integer          not null, primary key
#  city        :string(127)
#  company     :string(255)
#  description :string(5000)
#  end_date    :datetime
#  position    :string(255)
#  start_date  :datetime
#  uuid        :string(36)       not null, indexed
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  resume_id   :integer          not null
#

class Experience < ApplicationRecord
  include ApplicationHelper::UUID

  belongs_to :resume, touch: true

  def as_json(options = {})
    super(except: [:id, :resume_id])
  end
end
