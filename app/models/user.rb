class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me
  has_many :posts
  has_many :votes
  has_many :replies
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  #validates :password, :presence => true       devise will handle this


  validates_length_of :first_name, :maximum => 20, :allow_blank => false
  validates_length_of :last_name, :maximum => 20, :allow_blank => false
  validates_length_of :email, :maximum => 30, :allow_blank => false
  #validates_length_of :password, :minimum => 6, :maximum => 12, :allow_blank => false   cannot have this for update

  def replies_on_posts
    sum_of_replies = 0
    self.posts.each {|post| sum_of_replies += post.replies.count }
    return sum_of_replies
  end

  def votes_on_posts
    sum_of_votes = 0
    self.posts.each {|post| sum_of_votes += post.votes.count}
    return sum_of_votes
  end

  def votes_on_replies
    sum_of_votes = 0
    #self.replies.each {|reply| sum_of_votes += reply.votes.count}
    return sum_of_votes
  end

  def votes_on_own
    return votes_on_posts + votes_on_replies
  end
end
