require 'rails_helper'

describe 'アイテム登録', type: :system do
  describe '一覧表示' do
    before do
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      FactoryBot.create(:item, name: 'aaa', user: user_a)
    end
    context 'ユーザーAがログインしているとき' do
      before do
        visit new_user_session_path
        fill_in 'ニックネーム', with: 'ユーザーA'
        fill_in'パスワード', with: 'password'
        click_button 'ログインする'
      end
      it 'ユーザーAが作成したアイテムが表示される' do
        expect(page).to have_content 'aaa'
      end
    end
  end
end