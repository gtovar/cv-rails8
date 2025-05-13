class Language < ApplicationRecord
  has_many :languages, dependent: :destroy
end
