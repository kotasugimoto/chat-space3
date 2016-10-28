require 'rails_helper'

describe Message do
	describe '#create' do

		it "正常に保存できる"do
        	message = build(:message)
        	expect(message).to be_valid
    	end

		it "bodyに中身が入ってない時保存できない" do
			message = build(:message, body: "")
			message.valid?
			expect(message.errors[:body]).to include("can't be blank")
		end

	end
end