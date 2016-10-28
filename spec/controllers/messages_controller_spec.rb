require 'rails_helper'

describe MessagesController, type: :controller do
	describe 'GET #index' do
		it "messageのviewに遷移しているか" do
			get :index

			expect(response).to have_http_status(:success)
		end

		it "インスタンス変数は期待した値になるか" do
			# グループ未実装のため空白
		end
	end
end
