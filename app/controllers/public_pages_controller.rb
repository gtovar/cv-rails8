class PublicPagesController < ApplicationController
  layout "gorman_template"  # usa tu layout con assets externos
  def home
    @resume = Resume.includes(:skills, :projects, :experiences, :educations, :contact_infos).first
  end
  def download_resume
  end
  def send_email
  end
end
