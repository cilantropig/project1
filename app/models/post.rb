class Post < ActiveRecord::Base
  belongs_to :user
  has_many :replies, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  validates :title, :body, :presence => true
end
