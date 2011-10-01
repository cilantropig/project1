class Post < ActiveRecord::Base
  belongs_to :user
  has_many :replies, :dependent => :destroy
  has_many :votes, :dependent => :destroy
<<<<<<< HEAD
  validates :title, :body, :presence => true
=======

  validates :title, :body, :presence => true

>>>>>>> master
end
