class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @resume = current_user.resumes.first
  end
end
