class HomesController < ApplicationController
  before_action :not_logged_in_check, only: [:top]

  def top
  end

  def account_deleted_notification
    session[:account_deleted] ? session[:account_deleted] = nil : redirect_to(root_path)
  end
end
