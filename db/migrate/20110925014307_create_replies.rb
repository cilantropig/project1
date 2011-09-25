class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :title
      t.text :body
      t.references :user
      t.references :post

      t.timestamps
    end
  end
end
