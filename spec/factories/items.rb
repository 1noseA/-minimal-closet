FactoryBot.define do
  factory :item do
    name { 'aaa' }
    text { 'aaa' }
    item_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
    user
  end
end