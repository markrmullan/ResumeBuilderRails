require 'test_helper'

class SanityCheckTest < ActiveSupport::TestCase
  test "assertion library is working" do
    assert true
  end

  test "equality check" do
    assert 1 + 3 == 4
  end
end
