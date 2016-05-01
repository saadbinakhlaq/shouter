class HomeController < ApplicationController
  before_filter :check_logged_in_user

  def show

  end

  private

  def check_logged_in_user
    if user_signed_in?
      redirect_to dashboard_path
    end
  end
end