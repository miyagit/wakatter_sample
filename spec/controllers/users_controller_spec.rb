require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
    let(:user) { create(:user) }
    let!(:user_post) { create(:post, user: user) }
    let!(:other_post) { create(:post) }
    
    before do
      get :show, params: { id: user.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the requested user to @user' do
      expect(assigns(:user)).to eq(user)
    end

    it 'assigns user posts to @posts' do
      expect(assigns(:posts)).to include(user_post)
      expect(assigns(:posts)).not_to include(other_post)
    end

    context 'when user has liked posts' do
      let!(:liked_post) { create(:post) }
      let!(:post_like) { create(:post_like, user: user, post: liked_post) }

      before do
        get :show, params: { id: user.id }
      end

      it 'assigns liked posts to @liked_posts' do
        expect(assigns(:liked_posts)).to include(liked_post)
      end
    end

    context 'when user has commented on posts' do
      let!(:commented_post) { create(:post) }
      let!(:post_comment) { create(:post_comment, user: user, post: commented_post) }

      before do
        get :show, params: { id: user.id }
      end

      it 'assigns commented posts to @commented_posts' do
        expect(assigns(:commented_posts)).to include(commented_post)
      end
    end
  end
end
