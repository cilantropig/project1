class ReplyVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :reply

  validates :reply_id, :user_id, :presence => true
  validates_uniqueness_of :reply_id, :scope => [:user_id]
end
