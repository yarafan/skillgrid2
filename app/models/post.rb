class Post < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  after_create :update_reviews_count
  scope :waiting_for_approval, ->(user_id) { where(user_id: user_id, to_be_approved: true) }
  scope :approved, ->(user_id) { where(user_id: user_id, to_be_approved: false) }

  def self.default_scope
    order('created_at ASC')
  end

  def update_visibility
    update_column(:to_be_approved, false)
  end

  private

  def update_reviews_count
    count = user.reviews_to_make + 3
    user.update_attribute(:reviews_to_make, count)
    user.save
  end
end
