require 'test_helper'

class VoteTest < ActiveSupport::TestCase

  test "valid vote" do
    vote = Vote.create(
      :user => users(:two),
      :post => posts(:one)
    )

    assert vote.save
  end

  test "require post" do
    vote = Vote.create(
      :user => users(:one)
    )

    assert !vote.save
  end

  test "require user" do
    vote = Vote.create(
      :post => posts(:one)
    )

    assert !vote.save
  end

  test "unique vote" do
    vote1 = Vote.create(
      :user => users(:one),
      :post => posts(:one)
    )
    vote2 = Vote.create(
      :user => users(:one),
      :post => posts(:one)
    )
    assert !vote2.save
  end

end
