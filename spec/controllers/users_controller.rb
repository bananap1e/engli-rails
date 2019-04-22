# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe UsersController, type: :controller do
  render_views
  describe 'User sessions' do
    context 'when user is logged in'
    it 'should show list phrases' do
      testUser = create(:user)
      login_as(testUser, scope: :user)
      visit phrases_path
      expect(page).to have_content 'Listing phrases'
    end
  end

  context 'when user is logged out' do
    it 'should redirect to the login page' do
      testUser = create(:user)
      login_as(testUser, scope: :user)
      visit phrases_path
      click_link 'User &nbsp'
      click_link 'Sign Out'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end
end
