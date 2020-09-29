require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end
    
    it 'contentとimageが存在指定していれば保存できること' do
      expect(@message).to be_valid
    end
    it 'contentが空でも保存ができること' do
      @message.content = nil
      expect(@message).to be_valid
    end
    it 'imageが空でも保存できること' do
      @message.image =nil
      expect(@message).to be_valid
    end
    it 'contentとimageが空では保存できないこと' do
      @message.content = nil
      @message.image = nil
      @message.valid?
      expect(@message.errors.full_message).to include("Content can't be blank")
    end
    it 'roomが紐付いていないと保存できないこと' do
      @message.room = nil
      @message.valid?
      expect(@message.errors.full_message).to include("Room must exits")
    end
    
    it 'userが紐付いてないと保存できないこと' do
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_message).to include("User must exits")
    end
  end
end      