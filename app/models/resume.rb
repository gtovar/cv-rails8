# app/models/resume.rb
class Resume < ApplicationRecord
  belongs_to :user

  has_many :languages, dependent: :destroy
  has_many :certifications, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :contact_infos, dependent: :destroy
end

