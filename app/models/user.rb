class User < ActiveRecord::Base
  has_many :posts
  has_many :votes
  has_many :replies
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true


  validates_length_of :first_name, :maximum => 20, :allow_blank => false
  validates_length_of :last_name, :maximum => 20, :allow_blank => false
  validates_length_of :email, :minimum => 3, :maximum => 30, :allow_blank => false
  validates_length_of :username, :minimum => 3, :maximum => 12, :allow_blank => false
  validates_length_of :password, :minimum => 6, :maximum => 12, :allow_blank => false

end
