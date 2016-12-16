class CreatePostsTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :posts do |t|
  		t.integer :user_id
  		t.timestamps :created_at
  		t.string :title, limit: 25
  		t.string :body, limit: 150
  	end
  end
end
