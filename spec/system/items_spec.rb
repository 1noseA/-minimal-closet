require 'rails_helper'

describe 'アイテム管理機能', type: :system do
  describe '一覧表示' do
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }

    before do
      FactoryBot.create(:item, name: 'aaa', user: user_a)
      visit new_user_session_path
      fill_in 'ニックネーム', with: login_user.name
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end

    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it 'ユーザーAが作成したアイテムが表示される' do
        expect(page).to have_content 'aaa'
      end
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

      it 'ユーザーAが作成したアイテムが表示されない' do
        expect(page).to have_no_content
      end
    end
  end
end
