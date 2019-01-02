module Fixtures
  def self.test_user
    # from seeds.rb
    User.find_by(email: 'user1@gmail.com')
  end
end
