# == Schema Information
#
# Table name: experiences
#
#  id          :integer          not null, primary key
#  company     :string(255)
#  description :string(5000)
#  end_date    :datetime
#  location    :string(127)
#  position    :string(255)
#  start_date  :datetime
#  uuid        :string(36)       not null, indexed
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  resume_id   :integer          not null
#

require 'rails_helper'

RSpec.describe Experience, type: :model do
end
