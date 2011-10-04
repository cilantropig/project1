class CreateReplyVotes < ActiveRecord::Migration
  def change
    create_table :reply_votes do |t|
      t.references :reply
      t.references :user

      t.timestamps
    end
  end
end
