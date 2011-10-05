class AdminController < ApplicationController

  # before destroying a user calls the admin_user method to check if the current user has permissions to destroy users
  before_filter :admin_user

  def index
  end

  def manage_users
    @users = User.all
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

  private
  # called by the filter before calling destroy
  def admin_user
    redirect_to(root_path) unless user_signed_in? and current_user.admin?
  end

end
