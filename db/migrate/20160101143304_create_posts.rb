class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :problem
      t.text :code
      t.text :review_questions
      t.boolean :reviewed, null: false, default: false
      t.boolean :to_be_approved, null: false, default: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
