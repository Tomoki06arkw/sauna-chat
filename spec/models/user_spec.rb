require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "名前を入力してください", "名前は不正な値です"
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールを入力してください", "パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください", "パスワードis invalid. Input half-width characters."
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードを入力してください", "半角数字で入力して下さい", "パスワード（確認用）とパスワードの入力が一致しません"
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "ニックネームを入力してください"
    end

    it 'profileが空では登録できない' do
      @user.profile = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "プロフィールを入力してください"
    end

    it 'experience_idが空では登録できない' do
      @user.experience_id = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "サウナ歴を入力してください", "サウナ歴を選んで下さい"
    end
  end
end
