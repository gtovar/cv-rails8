class Project < ApplicationRecord
  belongs_to :resume
  validates :slug, presence: true, uniqueness: { scope: :resume_id }
  def to_param
    slug
  end
end
