class Review < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  after_create :update_reviews_count

  private

  def update_reviews_count
    if user.reviews_to_make > 0
      count = user.reviews_to_make - 1 
      user.update_attribute(:reviews_to_make, count)
      user.save
      Post.waiting_for_approval(user.id).first.update_visibility if user.reviews_to_make % 3 == 0
    end
  end
end
