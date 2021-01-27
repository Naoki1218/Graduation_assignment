require 'rails_helper'
RSpec.describe 'ユーザ登録・ログイン・ログアウト機能', type: :system do

  def user_login
    visit new_user_session_path
    fill_in '名前', with: 'test1'
    fill_in 'パスワード', with: '11111111'
    click_button 'ログイン'
  end

  def admin_user_login
    visit new_user_session_path
    fill_in '名前', with: 'admin'
    fill_in 'パスワード', with: '00000000'
    click_button 'ログイン'
  end

  describe '管理画面機能' do
    before do
      @user = FactoryBot.create(:user)
      @admin_user = FactoryBot.create(:admin_user)
    end

    context '管理者でログインしている時' do
      before do
        admin_user_login
        sleep 1
        click_link '管理者画面'
      end

      it '管理者は管理画面にアクセスできる' do
        expect(current_path).to eq rails_admin_path
      end

      it '管理者はユーザーを新規登録できる' do
        sleep 1
        page.all(".pjax")[8].click
        click_link '新規作成'

        fill_in 'Eメール', with: 'test8@test8.com'
        fill_in 'パスワード', with: '88888888'
        fill_in 'パスワード（確認用）', with: '88888888'
        fill_in '名前', with: 'test8'
        click_on '保存'

        expect(page).to have_content 'test8@test8.com'
      end

      it '管理者はユーザー詳細画面にアクセスできる' do
        sleep 1
        page.all(".pjax")[8].click
        page.all(".icon-info-sign")[1].click
        expect(page).to have_content "ユーザー 'test1'の詳細"
      end
  #
      it '管理者はユーザーの編集画面からユーザー情報を編集できる' do
        sleep 1
        visit rails_admin_path
        page.all(".pjax")[8].click
        page.all(".icon-info-sign")[1].click
        page.all(".icon-pencil")[0].click
        fill_in 'Eメール', with: 'test2@test2.com'
        fill_in 'パスワード', with: '22222222'
        fill_in 'パスワード（確認用）', with: '22222222'
        fill_in '名前', with: 'test2'
        click_on '保存'

        expect(page).to have_content "ユーザー 'test2'の詳細"
        expect(page).to have_content 'test2@test2.com'
        expect(page).to have_content 'test2'
      end

      it '管理者はユーザの削除をできること' do
        sleep 1
        visit rails_admin_path
        page.all(".pjax")[8].click
        page.all(".icon-remove")[2].click
        page.all(".btn.btn-danger")[0].click

        expect(page).to have_content 'ユーザーの削除に成功しました'
      end

        it '管理者は製品を新規登録できる' do
          sleep 1
          visit rails_admin_path
          page.all(".pjax")[6].click
          click_link '新規作成'
          
          fill_in 'Name', with: 'シリコン'
          fill_in 'Stock', with: '100'
          fill_in 'Unit price', with: '500'
          click_on '保存'

          expect(page).to have_content 'Productの作成に成功しました'
          expect(page).to have_content 'シリコン'
        end
      end
    end
  end
