class ApplicationController < ActionController::Base
  protect_from_forgery

# Devise: Where to redirect users once they have logged in
  def after_sign_in_path_for(resource)
#    if current_user.admin?
#      "/admin/index" # <- Path you want to redirect the user to.
#    else
      "/posts" # <- Path you want to redirect the user to.
#    end
  end

  def admin_path(resource)
    "/admin/index"
  end

  def admin_path(resource)
    "/admin/index"
  end

  def admin_path(resource)
    "/admin/index"
  end

  def admin_path(resource)
    "/admin/index"
  end

  def admin_path(resource)
    "/admin/index"
  end

  def admin_path(resource)
    "/admin/index"
  end

  def admin_path(resource)
    "/admin/index"
  end
end
