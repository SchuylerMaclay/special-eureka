class CreateQweets < ActiveRecord::Migration
  def change
    create_table :qweets do |t|
      t.string :content
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
