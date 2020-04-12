class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def as_json(options = {})
    super(options)
      .reject { |k, v| v.nil? } # exclude `null` values from JSON to allow for easier destructuring
  end
end
