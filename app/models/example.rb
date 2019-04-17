class Example < ActiveRecord::Base
  include IsAuthorMethod

  belongs_to :phrase
  belongs_to :user

  validates :example, presence: true
end