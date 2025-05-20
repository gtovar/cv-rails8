class PublicPagesController < ApplicationController
  include ActionView::Helpers::DateHelper
  layout "gorman_template"

  def home
    @resume = Resume.includes(:skills, :projects, :experiences, :educations, :contact_infos).first
  end
  def download_resume
  end
  def send_email
  end
end
