class Phrase < ApplicationRecord
  include IsAuthorMethod
  extend FriendlyId

  CATEGORIES = [['Actions', 0], ['Time', 1], ['Productivity', 2], ['Apologies', 3], ['Common', 4]]

  belongs_to :user
  has_many   :examples
  accepts_nested_attributes_for :examples, allow_destroy: true

  friendly_id :phrase, use: :slugged

  validates :translation, :phrase, presence: true
  validates :category, inclusion: {
      in: %w(Actions Time Productivity Apologies Common),
      message: "%{value} is not a valid category"
      }
  enum category: %w(Actions Time Productivity Apologies Common)

end