class Post < ActiveRecord::Base
  belongs_to :user
  has_many :replies, :dependent => :destroy
  has_many :votes, :dependent => :destroy

  validates :title, :body, :presence => true

  public

  def active?
    return weight < 240 # hours in 10 days
  end

  def weight
    time = Time.now
    dif = time - self.created_at
    seconds_in_an_hour = 3600
    seconds = dif / seconds_in_an_hour

    # each vote extends post life by one hour
    return seconds - self.votes.count
  end

  def was_searched_for?(search)
    if search == nil or
        self.title.downcase.index(search) or
        self.body.downcase.index(search)
      return true
    else
      return false
    end
  end

end
