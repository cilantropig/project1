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
    @sum_of_reply_votes = ReplyVote.all.count
  end

end
