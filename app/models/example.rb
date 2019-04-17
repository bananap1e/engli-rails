class Example < ActiveRecord::Base
  include IsAuthorMethod

  belongs_to :phrase
  belongs_to :user

  acts_as_votable

  validates :example, presence: true
end