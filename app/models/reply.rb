class Reply < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :reply_votes, :dependent => :destroy
  validates :title, :body, :presence => true

  def weight
    time = Time.now
    dif = time - self.created_at
    seconds_in_an_hour = 3600
    seconds = dif / seconds_in_an_hour

    # each vote extends post life by one hour
    return seconds - self.reply_votes.count
  end

end
