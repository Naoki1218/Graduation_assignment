require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'バリデーションのテスト' do
    before do
      @product = FactoryBot.create(:product)
      @product2 = FactoryBot.create(:product2)
      @admin_user = FactoryBot.create(:admin_user)
    end
      context '製品登録の際、製品名が空の場合' do
        it 'バリデーションにひっかる' do

          product = Product.new(name: '', stock: '10', unit_price: '2000')
          expect(product).not_to be_valid
        end
      end

      context '製品登録の際、ストックが空の場合' do
        it 'バリデーションにひっかかる' do
          # ここに内容を記載する
          product = Product.new(name: 'ゴールド', stock: '', unit_price: '2000')
          expect(product).not_to be_valid
        end
      end

      context '製品登録の際、単価が空の場合' do
        it 'バリデーションにひっかかる' do
          # ここに内容を記載する
          product = Product.new(name: 'ゴールド', stock: '10', unit_price: '')
          expect(product).not_to be_valid
        end
      end

      context '製品登録の際、製品名とストックと単価に内容が記載されている場合' do
        it 'バリデーションが通る' do

          product = Product.new(name: 'ゴールド', stock: '10', unit_price: '2000')
          expect(product).to be_valid
        end
      end
    end
end
