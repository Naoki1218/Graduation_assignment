require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'バリデーションのテスト' do
      context 'ユーザー登録の際、Eメールが空の場合' do
        it 'バリデーションにひっかる' do

          user = User.new(email: '', password: '11111111', name: 'test1')
          expect(user).not_to be_valid
        end
      end

      context 'ユーザー登録の際、パスワードが空の場合' do
        it 'バリデーションにひっかかる' do
          # ここに内容を記載する
          user = User.new(email: 'test1@test1.com', password: '', name: 'test1')
          expect(user).not_to be_valid
        end
      end

      context 'ユーザー登録の際、名前が空の場合' do
        it 'バリデーションにひっかかる' do
          # ここに内容を記載する
          user = User.new(email: 'test1@test1.com', password: '11111111', name: '')
          expect(user).not_to be_valid
        end
      end

      context 'ユーザー登録の際、Eメールとパスワードと名前に内容が記載されている場合' do
        it 'バリデーションが通る' do

          user = User.new(email: 'test1@test1.com', password: '11111111', name: 'test1')
          expect(user).to be_valid
        end
      end

      context 'ユーザー登録の際、Eメールとパスワードと名前と管理者欄に内容が記載され、かつ管理者のチェックボックスにチェックがされている場合' do
        it 'バリデーションが通る' do

          user = User.new(email: 'admin@admin.com', password: '00000000', name: 'admin', admin: 'true')
          expect(user).to be_valid
        end
      end
      context 'ログインの際、名前が空の場合' do
        it 'バリデーションにひっかかる' do
          # ここに内容を記載する
          user = User.new(name: '', password: '11111111')
          expect(user).not_to be_valid
        end
      end
      context 'ログインの際、パスワードが空の場合' do
        it 'バリデーションにひっかかる' do
          # ここに内容を記載する
          user = User.new(name: 'test1', password: '')
          expect(user).not_to be_valid
        end
      end
    end
end
