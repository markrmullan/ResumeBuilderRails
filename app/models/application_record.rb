class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def as_json(options = {})
    recursive_remove_empty_and_nil_values(super(options))
  end

  # exclude `null` values from JSON to allow for easier destructuring
  def recursive_remove_empty_and_nil_values(hash_or_array)
    p = proc do |*args|
      v = args.last
      v.delete_if(&p) if v.respond_to? :delete_if
      v.nil? || v.respond_to?(:"empty?") && v.empty?
    end

    hash_or_array.delete_if(&p)
  end
end
