require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(email: 'test') }
  context 'has no posts, no reviews initially' do
    it 'adds post' do
      post = user.posts.create!
      expect(post.to_be_approved).to eq true
      expect(user.reviews_to_make).to eq 3
    end

    it 'adds review after adding post' do
      user.posts.create!
      expect { user.reviews.create! }.to change { user.reviews_to_make }.from(3).to(2)
      expect(user.reviews.count).to eq 1
    end

    it 'adds 3 reviews after adding post' do
      user.posts.create!
      (1..3).each { user.reviews.create! }
      expect(user.reviews.count).to eq 3
      expect(user.reviews_to_make).to eq 0
      expect(user.posts.first.to_be_approved).to eq false
    end
  end
  context 'has few posts and few reviews' do
    it 'has 3 reviews and 2 posts' do
      (1..2).each { user.posts.create! }
      (1..3).each { user.reviews.create! }
      expect(user.reviews_to_make).to eq 3
      expect(user.reviews.count).to eq 3
      expect(user.posts.count).to eq 2
      expect(Post.waiting_for_approval(user.id).count).to eq 1
      expect(Post.approved(user.id).count).to eq 1
    end
  end
end
