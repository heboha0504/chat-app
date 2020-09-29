FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |item|
      item.image.sttach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
      
  end
end