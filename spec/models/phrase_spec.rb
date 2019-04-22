# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe 'Phrase' do
  let(:phrase) { build(:phrase) }
  subject { phrase }
  context 'does has attributes' do
    it { should respond_to(:phrase) }
    it { should respond_to(:translation) }
    it { should respond_to(:category) }
  end
  context 'is valid?' do
    describe 'when attribute is invalid' do
      it 'fails validation with phrase' do
        phrase.phrase = nil
        expect(phrase).to have(1).error_on(:phrase)
      end
      it 'fails validation with translation' do
        phrase.translation = nil
        expect(phrase).to have(1).error_on(:translation)
      end
      it 'fails validation with category' do
        phrase.category = nil
        expect(phrase).to have(1).error_on(:category)
      end
    end
  end
end
