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

require 'rails_helper'

RSpec.describe Experience, type: :model do
end
