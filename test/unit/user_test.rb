require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = User.create(
      :first_name => "John",
      :last_name => "Smith",
      :email => "john_smith@test.com",
      :password => "ruby4all"
    )

    assert user.save
  end

  test "require first name" do
    user = User.create(
      :last_name => "Smith",
      :email => "john_smith@test.com",
      :password => "ruby4all"
    )

    assert !user.save
  end

  test "require last name" do
    user = User.create(
      :first_name => "John",
      :email => "john_smith@test.com",
      :password => "ruby4all"
    )

    assert !user.save
  end

  test "require email" do
    user = User.create(
      :first_name => "John",
      :last_name => "Smith",
      :password => "ruby4all"
    )

    assert !user.save
  end

  test "unique user" do
    user1 = User.create(
      :first_name => "John",
      :last_name => "Smith",
      :email => "john@test.com",
      :password => "ruby4all"
    )

    user2 = User.create(
      :first_name => "Johnny",
      :last_name => "Johnson",
      :email => "john@test.com",
      :password => "ruby4all2"
    )

    assert !user2.save
  end

  test "first name too long" do
    user = User.create(
      :first_name => "JohnJacobJingleHeimerSmith",
      :last_name => "Smith",
      :email => "john_smith@test.com",
      :password => "ruby4all"
    )

    assert !user.save
  end

  test "last name too long" do
    user = User.create(
      :first_name => "John",
      :last_name => "JohnJacobJingleHeimerSmith",
      :email => "john_smith@test.com",
      :password => "ruby4all"
    )

    assert !user.save
  end

  test "email too long" do
    user = User.create(
      :first_name => "John",
      :last_name => "Smith",
      :email => "user1asdflkjasdflasdflkjasdfljkasdflkjasf@test.com",
      :password => "ruby4all"
    )

    assert !user.save
  end

  test "replies on posts" do
    user = User.create(
      :first_name => "John",
      :last_name => "Smith",
      :email => "john_smith@test.com",
      :password => "ruby4all"
    )
    post = Post.create(
      :user => user,
      :title => "hey",
      :body => "there"
    )
    reply1 = Reply.create(
      :user => users(:one),
      :post => post,
      :title => "hey",
      :body => "there"
    )
    reply2 = Reply.create(
      :user => users(:two),
      :post => post,
      :title => "hey",
      :body => "there"
    )

    assert user.replies_on_posts == 2
  end

  test "votes on posts" do
    user = User.create(
      :first_name => "John",
      :last_name => "Smith",
      :email => "john_smith@test.com",
      :password => "ruby4all"
    )
    post = Post.create(
      :user => user,
      :title => "hey",
      :body => "there"
    )
    vote1 = Vote.create(
      :user => users(:one),
      :post => post
    )
    vote2 = Vote.create(
      :user => users(:two),
      :post => post
    )

    assert user.votes_on_posts == 2
  end

  test "votes on replies" do
    user = User.create(
      :first_name => "John",
      :last_name => "Smith",
      :email => "john_smith@test.com",
      :password => "ruby4all"
    )
    post = Post.create(
      :user => user,
      :title => "hey",
      :body => "there"
    )
    reply = Reply.create(
      :user => user,
      :post => post,
      :title => "hey",
      :body => "there"
    )
    replyVote1 = ReplyVote.create(
      :user => users(:one),
      :reply => reply
    )
    replyVote2 = ReplyVote.create(
      :user => users(:two),
      :reply => reply
    )

    assert user.votes_on_replies == 2
  end

  test "votes on own" do
    user = User.create(
      :first_name => "John",
      :last_name => "Smith",
      :email => "john_smith@test.com",
      :password => "ruby4all"
    )
    post = Post.create(
      :user => user,
      :title => "hey",
      :body => "there"
    )
    reply = Reply.create(
      :user => user,
      :post => post,
      :title => "hey",
      :body => "there"
    )
    vote = Vote.create(
      :user => users(:one),
      :post => post
    )
    replyVote = ReplyVote.create(
      :user => users(:two),
      :reply => reply
    )

    assert user.votes_on_own == 2
  end

end
