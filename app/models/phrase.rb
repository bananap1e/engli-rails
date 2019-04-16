class Phrase < ApplicationRecord
  validates :translation, :phrase, presence: true
end
