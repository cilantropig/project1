require 'test_helper'

class ReplyVoteTest < ActiveSupport::TestCase
  test "valid reply vote" do
    reply_vote = ReplyVote.create(
      :user => users(:one),
      :reply => replies(:one)
    )

    assert reply_vote.save
  end

  test "require reply" do
    reply_vote = ReplyVote.create(
      :user => users(:one)
    )

    assert !reply_vote.save
  end

  test "require user" do
    reply_vote = ReplyVote.create(
      :reply => replies(:one)
    )

    assert !reply_vote.save
  end

  test "unique reply vote" do
    reply_vote1 = ReplyVote.create(
      :user => users(:one),
      :reply => replies(:one)
    )
    reply_vote2 = ReplyVote.create(
      :user => users(:one),
      :reply => replies(:one)
    )
    assert !reply_vote2.save
  end
  
end
