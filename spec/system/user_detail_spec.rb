require 'rails_helper'

RSpec.describe 'User detail page', type: :system do
  let(:user) { create(:user, username: 'test_user') }
  let!(:user_post) { create(:post, user: user, title: 'User Post') }
  let!(:other_post) { create(:post, title: 'Other Post') }
  
  before do
    # Create a like and comment for the user
    create(:post_like, user: user, post: other_post)
    create(:post_comment, user: user, post: other_post, body: 'Test comment')
  end

  it 'displays user detail page with tabs' do
    visit user_path(user)
    
    expect(page).to have_content("#{user.username}さんの詳細ページ")
    expect(page).to have_link('投稿した記事 (1)')
    expect(page).to have_link('いいねした記事 (1)')
    expect(page).to have_link('コメントした記事 (1)')
    expect(page).to have_content('User Post')
  end
end