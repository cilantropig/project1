class Reply < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :title, :body, :presence => true
end
