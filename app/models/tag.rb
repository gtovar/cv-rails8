class Tag < ApplicationRecord
  belongs_to :resume
  has_many :taggings, dependent: :destroy
  has_many :projects, through: :taggings, source: :taggable, source_type: 'Project'
  has_many :skills, through: :taggings, source: :taggable, source_type: 'Skill'
  has_many :certifications, through: :taggings, source: :taggable, source_type: 'Certification'
end

