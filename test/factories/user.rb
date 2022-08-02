FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { 'john@gmail.com' }
    password { 'mypass' }
  end
end
