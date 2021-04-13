FactoryBot.define do
  factory :user do
    username { "Aaron" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "dottle-nouveau-pavilion-tights-furze" }

    # 画像アップロード済み
    trait :due_with_image do
      image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/files/test.jpg')) }
    end
  end
end
