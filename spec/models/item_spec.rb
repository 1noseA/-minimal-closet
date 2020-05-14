require 'rails_helper'
RSpec.describe Item, type: :model do
  context "データが正しく保存される" do
    before do
      @item = FactoryBot.create(:item)
    end

    it "全て入力してあるので保存される" do
      expect(@item).to be_valid
    end

    context "データが正しく保存されない" do
      before do
        @item = Item.new
        @item.item_image_id = ""
        @item.name = "Tシャツ"
        @item.category_id = 1
        @item.scene_id = 1
        @item.season_id = 1
        @item.text = "夏の定番"
        @item.save
      end

      it "item_imageが入力されていないので保存されない" do
        expect(@item).to be_invalid
        expect(@item.errors[:item_image]).to include("を入力してください")
      end
    end
  end
end
