require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let!(:user_posts) { create_list(:post, 2, user: user) }
  let!(:other_posts) { create_list(:post, 3) }
  
  before do
    # Create likes for the user
    other_posts.each { |post| create(:post_like, user: user, post: post) }
    
    # Create comments for the user  
    other_posts.first(2).each { |post| create(:post_comment, user: user, post: post) }
  end

  describe 'GET #show' do
    before { get :show, params: { id: user.id } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the correct user' do
      expect(assigns(:user)).to eq(user)
    end

    it 'assigns user posts' do
      expect(assigns(:user_posts)).to match_array(user_posts)
    end

    it 'assigns liked posts' do
      expect(assigns(:liked_posts)).to match_array(other_posts)
    end

    it 'assigns commented posts' do
      expect(assigns(:commented_posts)).to match_array(other_posts.first(2))
    end
  end
end