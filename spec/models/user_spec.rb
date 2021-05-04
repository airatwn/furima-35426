require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)

  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
     it 'nicknameとemail、passwordとpassword_confirmationとfirst_nameとfirst_name_kanaとfamily_nameとfamily_name_kanaとbirthdayが存在すれば登録できる' do
      expect(@user).to be_valid
     end
    end

  end 
    context '新規登録できないとき' do
     it 'nicknameが空では登録できない' do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it 'emailが空では登録できない' do
      @user.email =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'emailが一意性でないと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
     it 'emailに@が含まれていないと登録できない' do
      @user.email ='aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end
     it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'passwordが6文字以下では登録できない' do
      @user.password = '111aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it 'passwordが半角英数字混合ではないと登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it 'passwordが確認用を含め2回入力しないと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'passwordとpassword_confirmation（確認用）は、値の一致が必須しないと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'ユーザー本名は、名字と名前がそれぞれ必須でないと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須でないと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end
     it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須でないと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end
     it '生年月日が必須でないと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
    end
  end
end