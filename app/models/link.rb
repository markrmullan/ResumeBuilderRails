# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  uuid       :string(36)       not null, indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  resume_id  :integer          not null
#
class Link < ApplicationRecord
  include ApplicationHelper::UUID

  belongs_to :resume, touch: true

  def as_json(options = {})
    super(except: [:id, :resume_id])
  end
end
