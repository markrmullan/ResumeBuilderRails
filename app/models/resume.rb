# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  uuid       :string(36)       not null, indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null, indexed
#

class Resume < ApplicationRecord
  include ApplicationHelper::UUID

  belongs_to :user
  validates_presence_of :name

  def as_json(options = {})
    super(except: [:id, :user_id])
  end
end
