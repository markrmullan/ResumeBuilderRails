module ApplicationHelper
  module UUID
    extend ActiveSupport::Concern

    included do
      self.primary_key = 'uuid'

      before_create :generate_uuid
    end

    def generate_uuid
      self.id = SecureRandom.uuid
    end
  end
end
