require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    context "ログインしている場合" do
      before do
        @user = FactoryBot.create(:user)
        login_user @user
      end
      it "ログインしたユーザーのページにリダイレクト" do
        get :index
        expect(response).to redirect_to user_path(@user)
      end

      it "302レスポンスを返すこと" do
        get :index
        expect(response).to have_http_status "302" 
      end
    end

    context "ゲストの場合" do
      it "正常にレスポンスを返すこと" do
        get :index
        expect(response).to be_success
      end

      it "200レスポンスを返すこと" do
        get :index
        expect(response).to have_http_status "200" 
      end
    end
  end

end
