# frozen_string_literal: true

module IsAuthorMethod
  extend ActiveSupport::Concern

  def is_author?(user)
    self.user == user
  end

  def set_carma(vote, current_user)
    current_user_carma_points = current_user.carma
    author_carma_points = user.carma
    author = user

    author_point = if self.class.name == 'Example'
                     vote == 'up' ? 2 : -1
                   else
                     vote == 'up' ? 4 : -2
                   end
    author.update_attribute('carma', author_carma_points + author_point)
    current_user.update_attribute('carma', current_user_carma_points + 1)
  end
end
