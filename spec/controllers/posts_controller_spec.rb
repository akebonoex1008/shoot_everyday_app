require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:user) { create(:user) }
  let(:new_post) { create(:post) } # new_　を付けないとエラーが発生
  let(:post_params) { attributes_for(:post) }

  describe "GET #index" do
    context "ログインしている場合" do
      before do
        login_user user
      end

      it "正常にレスポンスを返すこと" do
        get :index
        expect(response).to be_success
      end

      it "200レスポンスを返すこと" do
        get :index
        expect(response).to have_http_status "200" 
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

  ##################################
  ##             new              ##
  ##################################

  describe "GET #new" do
    context "ログインしている場合" do
      before do
        login_user user
      end

      it "正常にレスポンスを返すこと" do
        get :new
        expect(response).to be_success
      end

      it "200レスポンスを返すこと" do
        get :new
        expect(response).to have_http_status "200" 
      end
    end

    context "ゲストの場合" do
      it "302レスポンスを返すこと" do
        get :new
        expect(response).to have_http_status "302" 
      end

      it "ログイン画面へリダイレクト" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  ################################
  ##         create             ##
  ################################

  describe "POST #create" do
    context "ログインしている場合" do
      before do
        login_user user
      end

      it "投稿を追加できること" do
        puts "#{post_params}"
        expect do
          post :create, params: { post: post_params }
        end.to change(user.posts, :count).by(1)
      end
    end
    
    context "ゲストとして" do
      it "302レスポンスを返すこと" do
        post :create, params: { post: post_params }
        expect(response).to have_http_status "302"
      end

      it "ログイン画面へリダイレクト" do
        post :create, params: { post: post_params }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  #########################################
  ##            destory                  ##
  #########################################

  describe "DELETE #destroy" do
    context "ログインしている場合" do
      before do
        login_user user
        post :create, params: { post: post_params }
      end

      it "投稿を削除できるていること" do
        expect do
          delete :destroy, params: { id: Post.last.id }
        end.to change(user.posts, :count).by(-1)
      end
    end
    
    context "ゲストとして" do
      it "302レスポンスを返すこと" do
        delete :destroy, params: { id: 1 }
        expect(response).to have_http_status "302"
      end

      it "ログイン画面へリダイレクト" do
        delete :destroy, params: { id: 1 }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
