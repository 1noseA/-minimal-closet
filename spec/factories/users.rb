FactoryBot.define do
  factory :user do
    name { 'ユーザーA' }
    email { 'a@example.com'}
    introduction { 'aaa' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end