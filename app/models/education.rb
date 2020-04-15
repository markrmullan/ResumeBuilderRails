# == Schema Information
#
# Table name: educations
#
#  id          :integer          not null, primary key
#  degree      :string(255)
#  description :string(5000)
#  end_date    :datetime
#  school      :string(255)
#  start_date  :datetime
#  uuid        :string(36)       not null, indexed
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  resume_id   :integer          not null
#
class Education < ApplicationRecord
  include ApplicationHelper::UUID

  belongs_to :resume, touch: true

  def as_json(options = {})
    super(except: [:id, :resume_id])
  end
end
