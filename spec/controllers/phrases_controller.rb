# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe PhrasesController, type: :controller do
  render_views
  describe 'GET phrases#index' do
    it 'show phrases on the page' do
      testUser = create(:user)
      login_as(testUser, scope: :user)
      testPhrases = create_list(:phrase, 2, user: testUser)
      visit phrases_path
      testPhrases.each do |onePhrase|
        page.should have_content(onePhrase.phrase)
        page.should have_content(onePhrase.translation)
      end
    end
  end

  describe 'POST phrases#create' do
    it 'should create a new phrase' do
      testUser = create(:user)
      login_as(testUser, scope: :user)
      visit new_phrase_path
      fill_in 'Phrase', with: 'Ruby on Rails'
      fill_in 'Translation', with: 'Text about Ruby on Rails'
      select 'Actions', from: 'Category'
      fill_in 'Example', with: 'Ruby on Rails'
      expect { click_button 'Submit' }.to change(Phrase, :count).by(1)
    end
    it 'should return an error' do
      testUser = create(:user)
      login_as(testUser, scope: :user)
      visit new_phrase_path
      click_button 'Submit'
      page.should have_content "Translation can't be blank and Phrase can't be blank"
    end
  end

  describe 'POST phrases#update' do
    it 'should update phrase' do
      testUser = create(:user)
      login_as(testUser, scope: :user)
      testPhrase = create(:phrase, user: testUser)
      visit phrases_path
      visit edit_phrase_path(testPhrase)
      fill_in 'Phrase', with: 'Freddie Mercury'
      fill_in 'Translation', with: 'Queen'
      click_button 'Submit'
      expect(testPhrase.reload.phrase).to eq 'Freddie Mercury'
      expect(testPhrase.translation).to eq 'Queen'
    end
    it 'should return an error' do
      testUser = create(:user)
      login_as(testUser, scope: :user)
      testPhrase = create(:phrase, user: testUser)
      visit phrases_path
      visit edit_phrase_path(testPhrase)
      fill_in 'phrase', with: ''
      fill_in 'phrase_translation', with: ''
      click_button 'Submit'
      page.should have_content "Translation can't be blank and Phrase can't be blank"
    end
  end

  describe 'delete phrases#destroy' do
    it 'should delete a phrase' do
      testUser = create(:user)
      login_as(testUser, scope: :user)
      testPhrase = create(:phrase, user: testUser)
      visit phrases_path
      expect { click_link 'delete' }.to change(Phrase, :count).by(-1)
    end
  end
end
