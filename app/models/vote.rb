class Vote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :post_id, :user_id, :presence => true
  validates_uniqueness_of :post_id, :scope => [:user_id]


end
