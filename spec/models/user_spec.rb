require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    it "nameとemail,passwordとpassword_cofirmationが存在すれば登録できること" do 
      expect(@user).to be_valid
    end

    it "nameが空では登録ができないこと" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "emailがからでは登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confimationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation dosen't match Password")

      it "passwordが6文字以上であれば登録できる" do
        @user. = "123456"
        @user.password_confirmation = "123456"
        expect(@user).to be_valid
      end
      
      it "passwordが５文字以下でsレバ登録できないこと" do
        @user.password = "12345"
        @user.password.confirmation = "12345"
        expect(@user.errors.full_messages).to include("password is top short(minimum is 6 characters)")
      end  

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
       expect(another_user.errors.full_messages).to include("Email has already been taken")
    end  
  end
end