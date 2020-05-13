# require 'rails_helper'
# RSpec.describe "Items", type: :request do
#   describe 'アイテム登録' do
#     context "アイテム登録ページが正しく表示される" do
#       before do
#         get new_item_path
#       end
#       it 'リクエストは200 OKとなること' do
#         expect(response.status).to eq 200
#       end
#       it 'タイトルが正しく表示されていること' do
#         expect(response.body).to include("アイテム登録")
#       end
#     end
#   end
# end