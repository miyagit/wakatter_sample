require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe '#follow' do
    context 'when user is not already following the other user' do
      it 'adds the other user to following list' do
        expect { user.follow(other_user) }.to change { user.following.count }.by(1)
        expect(user.following).to include(other_user)
      end
    end

    context 'when user is already following the other user' do
      before do
        user.follow(other_user)
      end

      it 'does not add the user again' do
        expect { user.follow(other_user) }.not_to change { user.following.count }
        expect(user.following.count).to eq(1)
      end
    end
  end

  describe '#unfollow' do
    context 'when user is following the other user' do
      before do
        user.follow(other_user)
      end

      it 'removes the other user from following list' do
        expect { user.unfollow(other_user) }.to change { user.following.count }.by(-1)
        expect(user.following).not_to include(other_user)
      end
    end

    context 'when user is not following the other user' do
      it 'does not change the following count' do
        expect { user.unfollow(other_user) }.not_to change { user.following.count }
      end
    end
  end

  describe '#following?' do
    context 'when user is following the other user' do
      before do
        user.follow(other_user)
      end

      it 'returns true' do
        expect(user.following?(other_user)).to be true
      end
    end

    context 'when user is not following the other user' do
      it 'returns false' do
        expect(user.following?(other_user)).to be false
      end
    end

    context 'when user unfollows the other user' do
      before do
        user.follow(other_user)
        user.unfollow(other_user)
      end

      it 'returns false' do
        expect(user.following?(other_user)).to be false
      end
    end
  end
end