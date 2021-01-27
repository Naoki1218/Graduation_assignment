require 'rails_helper'
RSpec.describe '見積書作成機能', type: :system do

  def user_login
    visit new_user_session_path
    fill_in 'session[name]', with: 'test1'
    fill_in 'session[password]', with: '11111111'
    click_button 'ログイン'
  end

  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user)
    # visit new_user_session_path
    # fill_in '名前',with: 'test1'
    # fill_in 'パスワード',with: '11111111'
    # click_button 'ログイン'
    # @estimate1 = FactoryBot.create(:estimate, customer_name: '株式会社AAA', user: @user)
  end
  describe '新規見積書作成機能' do
    context '見積書を新規作成した場合' do
      it '作成した見積書が表示される' do
        visit new_estimate_path

        select '株式会社AAA',from: '顧客'
        select '2022',from: 'estimate_deadline_1i'
        select '1',from: 'estimate_deadline_2i'
        select '11',from: 'estimate_deadline_3i'
        select 'ゴールド',from: '製品名'
        fill_in 'estimate_estimate_products_attributes_0_quantity', with: '2'
        click_button '登録する'
        expect(page).to have_content '株式会社AAA'
      end
    end
    context '見積書を新規作成し、値引をした場合' do
      it '金額が値引きされた見積書が作成される' do
        visit new_estimate_path

        select '株式会社BBB',from: '顧客'
        select '2023',from: 'estimate_deadline_1i'
        select '2',from: 'estimate_deadline_2i'
        select '22',from: 'estimate_deadline_3i'
        fill_in '値引額',with: '100'
        select 'ドライポンプ',from: '製品名'
        fill_in 'estimate_estimate_products_attributes_0_quantity', with: '1'
        click_button '登録する'
        expect(page).to have_content '株式会社BBB'
        binding.irb
      end
    end
  end
  # describe '一覧表示機能' do
  #   context '一覧画面に遷移した場合' do
  #     it '作成済みの見積書一覧が表示される' do
  #       visit estimates_path
  #
  #       expect(page).to have_content '株式会社AAA'
  #     end
  #   end
  # end
  describe '詳細表示機能' do
     context '任意の見積書詳細画面に遷移した場合' do
       it '該当見積書の内容が表示される' do
          visit estimate_path(@estimate1)

          expect(page).to have_content '株式会社AAA御中'
       end
     end
  end
end
