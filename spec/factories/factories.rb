# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email                   { Faker::Internet.email }
    username                { Faker::Internet.user_name }
    password                { 'qwerty123' }
    password_confirmation   { 'qwerty123' }
  end

  factory :phrase do
    user
    phrase                  { Faker::University.name }
    translation             { Faker::ProgrammingLanguage.name }
  end

  factory :example do
    user
    phrase
    example { Faker::WorldCup.team }
  end
end
