require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "valid post" do
    post = Post.create(
      :user => users(:one),
      :title => "hey",
      :body => "there"
    )

    assert post.save
  end

  test "require title" do
    post = Post.create(
      :user => users(:one),
      :body => "there"
    )

    assert !post.save
  end

  test "require body" do
    post = Post.create(
      :user => users(:one),
      :title => "hey"
    )

    assert !post.save
  end

  test "require user" do
    post = Post.create(
      :title => "hey",
      :body => "there"
    )

    assert !post.save
  end


  test "weight starts at 0" do
    post = Post.create(
      :user => users(:one),
      :title => "hey",
      :body => "there"
    )

    assert equalsFloat(post.weight, 0)
  end

  test "weight drops -1 after vote" do
    oldWeight = posts(:one).weight
    vote = Vote.create(
      :user => users(:one),
      :post => posts(:one)
    )
    newWeight = posts(:one).weight

    assert equalsFloat(newWeight - oldWeight, -1)
  end


  # additional testing of active? would requite something like Timecop
  # http://stackoverflow.com/questions/1215245/ruby-unit-testing-how-to-fake-time-now

  test "active post" do
    post = Post.create(
      :user => users(:one),
      :title => "hey",
      :body => "there"
    )

    assert post.active?
  end

  test "included in search" do
    post = Post.create(
      :user => users(:one),
      :title => "hey there",
      :body => "what's up?"
    )

    assert post.was_searched_for?("hey")
  end

  test "not included in search" do
    post = Post.create(
      :user => users(:one),
      :title => "hey there",
      :body => "what's up?"
    )

    assert !post.was_searched_for?("not much")
  end

end
