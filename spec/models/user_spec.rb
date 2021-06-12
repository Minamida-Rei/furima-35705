require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

   context '新規登録ができるとき' do
    it "nickname, email, password, password_confirmation, first_name, last_name, first_name_kana, last_name_kanaが存在すれば新規登録できる" do
      expect(@user).to be_valid
    end
   end

   context '新規登録ができないとき' do
    it "nicknameが空白だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it "passwordが空白だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it "first_nameが空白だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    
    it "last_nameが空白だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it "first_name_kanaが空白だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it "last_name_kanaが空白だと登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it "birthdayが空白だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    
    it "emailに@がなければ登録できない" do
      @user.email = 'test.example.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

    it "emailが既に登録されている場合、同じemailで登録できない" do
      @user2 = FactoryBot.build(:user)
      @user2.email = @user.email
      @user.save
      @user2.valid?
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end

    it "passwordが6文字未満だと登録できない" do
      @user.password = "aaa11"
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it "passwordとpassword_confirmationが一致しなければ登録できない、また空白でも登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_nameにアルファベットがあると登録できない" do
      @user.first_name = "a山口"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end

    it "last_nameにアルファベットがあると登録できない" do
      @user.last_name = "和也b"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end

    it "first_name_kanaにカタカナ以外があると登録できない" do
      @user.first_name_kana = "麻生あずなvct"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end

    it "last_name_kanaにカタカナ以外があると登録できない" do
      @user.last_name_kana = "jonny秀吉ちゃん"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
    end

    it "passwordは半角英数混合でないと登録できない" do
      @user.password = "あ３111111"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it "passwordは全角では登録できない" do
      @user.password = "あいうえお１１Ａ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it "passwordは半角英字のみでは登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it "passwordは半角数字のみでは登録できない" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
   end

  end
end