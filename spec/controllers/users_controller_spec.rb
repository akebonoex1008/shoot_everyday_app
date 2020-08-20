require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  let(:user) { create(:user) }

  describe "GET #index" do
    context "ログインしている場合" do
      before do
        login_user user
      end

      it "正常にレスポンスを返す" do
        get :index
        expect(response).to be_success
      end

      it "200レスポンスを返すこと" do
        get :index
        expect(response).to have_http_status "200" 
      end
    end

    context "ゲストの場合" do
      it "正常にレスポンスを返す" do
        get :index
        expect(response).to be_success
      end

      it "200レスポンスを返すこと" do
        get :index
        expect(response).to have_http_status "200" 
      end
    end
  end

  ###   show    ###

  describe "GET #show" do
    context "ログインしている場合" do
      before do
        login_user user
      end  

      it "正常にレスポンスを返す" do
        get :show, params: { id: user.id }
        expect(response).to be_success
      end

      it "200レスポンスを返すこと" do
        get :show, params: { id: user.id }
        expect(response).to have_http_status "200" 
      end
    end

    context "ゲストの場合" do
      it "ログイン画面へリダイレクトすること" do
        get :show, params: { id: 1 }
        expect(response).to redirect_to new_user_session_path
      end

      it "302レスポンスを返すこと" do
        get :show, params: { id: 1 }
        expect(response).to have_http_status "302" 
      end
    end
  end
end
