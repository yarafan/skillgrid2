require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(email: 'test') }
  context 'has no posts, no reviews initially' do
    before(:each) do
      @post = user.posts.create!
    end

    context 'adds one post and one review' do
      it 'adds post and post should\'t be approved initialy' do
        expect(@post.to_be_approved).to eq true
      end

      it 'adds post and his reviews_to_make should be 3' do
        expect(user.reviews_to_make).to eq 3
      end

      it 'adds review and total reviews should be increased by 1' do
        user.reviews.create!
        expect(user.reviews.count).to eq 1
      end

      it 'adds review and change reviews_to_make to 2' do
        expect { user.reviews.create! }.to change { user.reviews_to_make }.from(3).to(2)
      end
    end

    context 'adds post and 3 reviews' do
      before(:each) do
        (1..3).each { user.reviews.create! }
      end

      it 'adds reviews after adding post and expect to has 3 reviews' do
        expect(user.reviews.count).to eq 3
      end

      it 'adds reviews after adding post and expect first it to be approved' do
        expect(user.posts.first.to_be_approved).to eq false
      end

      it 'adds reviews after adding post and expect his reviews_to_make to be 0' do
        expect(user.reviews_to_make).to eq 0
      end
    end
  end

  context 'has 3 reviews and 2 posts' do
    before(:each) do
      (1..2).each { user.posts.create! }
      (1..3).each { user.reviews.create! }
    end

    it 'expects his reviews_to_make to be 3' do
      expect(user.reviews_to_make).to eq 3
    end

    it 'expects his total reviews to be 3' do
      expect(user.reviews.count).to eq 3
    end

    it 'expects his total posts  to be 2' do
      expect(user.posts.count).to eq 2
    end

    it 'expects one of posts to be approved' do
      expect(Post.approved(user.id).count).to eq 1
    end
    it 'expects one of posts waiting to be approved' do
      expect(Post.waiting_for_approval(user.id).count).to eq 1
    end
  end
end
