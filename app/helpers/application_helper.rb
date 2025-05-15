module ApplicationHelper
  def contact_info(kind)
    @resume.contact_infos.find_by(kind: kind)&.value
  end
end
