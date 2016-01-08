class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :text
      t.references :post, index: true

      t.timestamps null: false
    end
  end
end
