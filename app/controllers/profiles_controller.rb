class ProfilesController < ApplicationController
  before_filter :authorize

  def index
  end

  def show
    if current_profile == current_user
      redirect_to root_path
    end
  end

  protected

  def current_profile
    @profile ||= User.find(params[:id])
  end
end
