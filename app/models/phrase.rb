class Phrase < ApplicationRecord
  CATEGORIES = [['Actions', 0], ['Time', 1], ['Productivity', 2], ['Apologies', 3], ['Common', 4]]

  belongs_to :user

  validates :translation, :phrase, presence: true
  validates :category, inclusion: {
      in: %w(Actions Time Productivity Apologies Common),
      message: "%{value} is not a valid category"
      }
  enum category: %w(Actions Time Productivity Apologies Common)

  def author?(user)
    self.user == user
  end

end
