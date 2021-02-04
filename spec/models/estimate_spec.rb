require 'rails_helper'

RSpec.describe Estimate, type: :model do

  describe 'バリデーションのテスト' do
    before do
      @product = FactoryBot.create(:product)
      @product2 = FactoryBot.create(:product2)
      @user = FactoryBot.create(:user)
      @estimate = FactoryBot.create(:estimate, user: @user)
      @estimate2 = FactoryBot.create(:another_estimate, user: @user)
      @estimate.products << @product
      @estimate2.products << @product2
    end
      context '見積書の顧客名が空の場合' do
        it 'バリデーションにひっかる' do

          estimate = Estimate.new(customer_name: '', deadline: '2022-01-11', product_name: 'ゴールド')
          expect(estimate).not_to be_valid
        end
      end

      context '見積書の納期が空の場合' do
        it 'バリデーションにひっかかる' do
          # ここに内容を記載する
          estimate = Estimate.new(customer_name: '株式会社AAA', deadline: '', product_name: 'ゴールド')
          expect(estimate).not_to be_valid
        end
      end

      context '見積書の製品名が選択されていない場合' do
        it 'バリデーションにひっかかる' do
          # ここに内容を記載する
          estimate = Estimate.new(customer_name: '株式会社AAA', deadline: '2022-01-11', product_name: '')
          expect(estimate).not_to be_valid
        end
      end

      context '見積書の顧客名と納期と製品名に内容が記載されている場合' do
        it 'バリデーションが通る' do

          # user = @user
          estimate = Estimate.new(customer_name: '株式会社AAA', deadline: '2022-01-11', product_name: 'ゴールド', user_id: 4)
          expect(estimate).to be_valid
        end
      end
    end
end
