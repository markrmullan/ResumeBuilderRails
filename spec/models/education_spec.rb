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
require 'rails_helper'

RSpec.describe Education, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
