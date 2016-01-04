class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :problem
      t.text :code
      t.text :review_questions

      t.timestamps null: false
    end
  end
end
