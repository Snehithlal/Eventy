# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    user_name { Faker::Internet.username(specifier: 5..10) }
    email { Faker::Internet.email }
    password { 'admin@123' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
