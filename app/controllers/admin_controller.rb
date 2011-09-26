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

end
