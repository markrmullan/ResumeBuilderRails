module Fixtures
  def self.test_user
    # from seeds.rb
    User.find_by(email: 'user1@gmail.com')
  end

  def self.test_user_2
    User.find_by(email: 'user2@gmail.com')
  end
end
