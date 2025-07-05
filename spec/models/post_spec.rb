require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#liked_by?' do
    subject { post.liked_by?(user) }
    
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    let(:post) { create(:post) }

    context 'when user has liked the post' do
      before do
        create(:post_like, user: user, post: post)
      end

      it 'returns true' do
        is_expected.to be true
      end
    end

    context 'when user has not liked the post' do
      it 'returns false' do
        is_expected.to be false
      end
    end

    context 'when different user has liked the post' do
      before do
        create(:post_like, user: other_user, post: post)
      end

      it 'returns false for the user who did not like it' do
        is_expected.to be false
      end

      context 'for the user who liked it' do
        subject { post.liked_by?(other_user) }

        it 'returns true' do
          is_expected.to be true
        end
      end
    end
  end
end