FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::internet.free_email}
    password = Faker::internet.password(min_length: 8)
    password {password}
    password_confimation {password}
  end
end