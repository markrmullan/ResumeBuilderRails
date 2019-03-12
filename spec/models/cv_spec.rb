# == Schema Information
#
# Table name: cvs
#
#  id         :integer          not null, primary key
#  uuid       :string(36)       not null
#  user_id    :integer          not null
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Cv, type: :model do
end
