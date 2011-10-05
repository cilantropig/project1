require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  test "valid reply" do
    reply = Reply.create(
      :user => users(:one),
      :post => posts(:one),
      :title => "hey",
      :body => "there"
    )

    assert reply.save
  end

  test "require title" do
    reply = Reply.create(
      :user => users(:one),
      :post => posts(:one),
      :body => "there"
    )

    assert !reply.save
  end

  test "require body" do
    reply = Reply.create(
      :user => users(:one),
      :post => posts(:one),
      :title => "hey"
    )

    assert !reply.save
  end

  test "weight starts at 0" do
    reply = Reply.create(
      :user => users(:one),
      :post => posts(:one),
      :title => "hey",
      :body => "there"
    )

    assert equalsFloat(reply.weight, 0)
  end

  test "weight drops -1 after vote" do
    oldWeight = replies(:one).weight
    reply_vote = ReplyVote.create(
      :user => users(:one),
      :reply => replies(:one)
    )
    newWeight = replies(:one).weight

    assert equalsFloat(newWeight - oldWeight, -1)
  end
end
