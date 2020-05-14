FactoryBot.define do
  factory :item do
    name { 'aaa' }
    text { 'aaa' }
    category_id { '1' }
    scene_id { '1' }
    season_id { '1' }
    item_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    user
  end
end
