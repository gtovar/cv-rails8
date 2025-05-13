class Certification < ApplicationRecord
  belongs_to :resume
  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, through: :taggings
end

