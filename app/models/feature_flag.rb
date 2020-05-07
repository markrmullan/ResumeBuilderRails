# == Schema Information
#
# Table name: feature_flags
#
#  id         :integer          not null, primary key
#  enabled    :boolean          default(FALSE), not null
#  name       :string(127)      not null, indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class FeatureFlag < ApplicationRecord
  def as_json(options = {})
    super(only: [:name, :enabled])
  end
end
