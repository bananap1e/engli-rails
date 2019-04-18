require 'rails_helper'
require 'spec_helper'

describe ExamplesController, :type => :controller do
  render_views
  describe 'POST example#create' do
    it 'should create a new example' do
      testUser = create(:user)
      login_as(testUser, :scope => :user)
      testPhrase = create(:phrase, user: testUser)
      visit phrases_path(testPhrase)
      fill_in 'Example', with: "Random Example"
      expect { click_button 'Create new Example' }.to change(Example, :count).by(+1)
    end
    it 'should return an error' do
      testUser = create(:user)
      login_as(testUser, :scope => :user)
      testPhrase = create(:phrase, user: testUser)
      visit phrases_path(testPhrase)
      fill_in 'Example', with: ""
      expect { click_button 'Create new Example' }.to change(Example, :count).by(+1)
    end
  end
  describe 'delete example#destroy' do
    it 'should delete a example' do
      testUser = create(:user)
      login_as(testUser, :scope => :user)
      testPhrase = create(:phrase, user: testUser)
      visit phrases_path(testPhrase)
      expect { click_link 'delete' }.to change(Example, :count).by(-1)
    end
  end

end