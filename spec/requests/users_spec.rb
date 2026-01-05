require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/:id' do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    
    let!(:user_post1) { create(:post, user: user) }
    let!(:user_post2) { create(:post, user: user) }
    let!(:other_post) { create(:post, user: other_user) }
    
    let!(:liked_post) { create(:post, user: other_user) }
    let!(:post_like) { create(:post_like, user: user, post: liked_post) }
    
    let!(:commented_post) { create(:post, user: other_user) }
    let!(:post_comment) { create(:post_comment, user: user, post: commented_post) }

    it 'returns a successful response' do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'displays the user information' do
      get user_path(user)
      expect(response.body).to include(user.username)
    end

    it 'displays the user posts' do
      get user_path(user)
      expect(response.body).to include(user_post1.title)
      expect(response.body).to include(user_post2.title)
    end

    it 'assigns the correct posts' do
      get user_path(user)
      expect(assigns(:posts)).to match_array([user_post1, user_post2])
    end

    it 'assigns the liked posts' do
      get user_path(user)
      expect(assigns(:liked_posts)).to include(liked_post)
    end

    it 'assigns the commented posts' do
      get user_path(user)
      expect(assigns(:commented_posts)).to include(commented_post)
    end
  end
end
