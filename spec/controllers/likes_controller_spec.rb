require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  let(:user) { create(:user) }        #　いいねする側
  let(:other_user) { create(:user) }  # いいねされる側

  describe "POST #create" do
    context "ログインしている場合" do
      before do
        @post = create(:post, user_id: other_user.id)
      end

      it "いいねできる" do
        expect do
          login_user user
          post :create, params: { post_id: @post.id }
        end.to change(@post.likes, :count).by(1)
      end

      it "自分の投稿へはいいねできない" do
        expect do
          login_user other_user
          post :create, params: { post_id: @post.id }
        end.to change(@post.likes, :count).by(0)
      end
    end

    context "ゲストとして" do
      it "302レスポンスを返すこと" do
        post :create, params: { post_id: 1 }
        expect(response).to have_http_status "302"
      end

      it "ログイン画面へリダイレクト" do
        post :create, params: { post_id: 1 }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  ############################
  ##       destroy          ##
  ############################

  describe "DELETE #destroy" do
    context "ログインしている場合" do
      before do
        login_user user
        @post = create(:post, user_id: other_user.id)
        post :create, params: { post_id: @post.id }
      end

      it "いいねを解除できる" do
        expect do
          delete :destroy, params: { id: Like.last.id }
        end.to change(@post.likes, :count).by(-1)
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
