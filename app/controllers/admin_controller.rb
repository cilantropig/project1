class AdminController < ApplicationController
  def index
  end

  def manage_users
    @users = User.all
  end

  def manage_posts
    @posts = Post.all
  end

  def view_reports
  end

  def report_users
    @users = User.all
    @sum_of_posts = Post.all.count
    @sum_of_replies = Reply.all.count
    @sum_of_votes = Vote.all.count
    @sum_of_votes_on_posts = 0
    Post.all.each {|post| @sum_of_votes_on_posts += post.votes.count }
    @sum_of_votes_on_replies = 0
    #Reply.all.each {|reply| @sum_of_votes_on_replies += reply.votes.count }

  end

end
