require 'rails_helper'
RSpec.describe '見積書作成機能', type: :system do

  def user_login
    visit new_user_session_path
    fill_in '名前', with: 'test1'
    fill_in 'パスワード', with: '11111111'
    click_button 'ログイン'
  end

  before do
    @product = FactoryBot.create(:product)
    @product2 = FactoryBot.create(:product2)
    @product3 = FactoryBot.create(:product3)
    @user = FactoryBot.create(:user)
    @estimate = FactoryBot.create(:estimate, user: @user)
    @estimate2 = FactoryBot.create(:another_estimate, user: @user)
    @estimate.products << @product
    @estimate2.products << @product2
    visit new_user_session_path
    fill_in '名前',with: 'test1'
    fill_in 'パスワード',with: '11111111'
    click_button 'ログイン'
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みの見積書一覧が表示される' do
        visit estimates_path

        expect(page).to have_content '株式会社AAA'
        expect(page).to have_content '株式会社BBB'
      end
    end
  end

  describe '新規見積書作成機能' do
    context '見積書を新規作成した場合' do
      it '作成した見積書が表示される' do
        visit new_estimate_path
        sleep 1
        select '株式会社CCC',from: '顧客'
        select '2022',from: 'estimate_deadline_1i'
        select '1',from: 'estimate_deadline_2i'
        select '11',from: 'estimate_deadline_3i'
        select 'ゴールド',from: '製品名'
        fill_in 'estimate_estimate_products_attributes_0_quantity', with: '2'
        click_button '登録する'
        expect(page).to have_content '株式会社CCC'

      end
      it '新しい見積書が一番下に表示される' do
        visit estimates_path
        estimate_list = all('tbody tr')
        expect(estimate_list[0]).to have_content '株式会社AAA'
        expect(estimate_list[1]).to have_content '株式会社BBB'
      end
    end
    context '見積書を新規作成し、値引をした場合' do
      it '金額が値引きされた見積書が作成される' do
        visit new_estimate_path

        select '株式会社DDD',from: '顧客'
        select '2023',from: 'estimate_deadline_1i'
        select '2',from: 'estimate_deadline_2i'
        select '22',from: 'estimate_deadline_3i'
        fill_in '値引額',with: '100'
        select 'ドライポンプ',from: '製品名'
        fill_in 'estimate_estimate_products_attributes_0_quantity', with: '1'
        click_button '登録する'
        expect(page).to have_content '株式会社DDD'
      end
    end
  end

  describe '詳細表示機能' do
     context '任意の見積書詳細画面に遷移した場合' do
       it '該当見積書の内容が表示される' do
          click_link '見積書詳細', match: :first
          expect(page).to have_content '株式会社AAA 御中'
          expect(page).to have_content 'ゴールド'
          expect(page).to have_content '納期: 2022-01-11'
          expect(page).to have_content '値引: 100'
          expect(page).to have_content '金額: 1900'
          expect(page).to have_content '税込: 2090'
       end
     end
  end

  describe '見積書編集機能' do
     context '任意の見積書編集画面に遷移した場合' do
       it '該当見積書の内容を編集できる' do
          click_link '見積書編集', match: :first
          page.driver.browser.switch_to.alert.accept
          select '株式会社LLL',from: '顧客'
          select '2022',from: 'estimate_deadline_1i'
          select '2',from: 'estimate_deadline_2i'
          select '22',from: 'estimate_deadline_3i'
          fill_in 'estimate_estimate_products_attributes_0_quantity', with: '2'
          click_button '更新する'
          expect(page).to have_content '株式会社LLL'
       end
     end
  end
end
