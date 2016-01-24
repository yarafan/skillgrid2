class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.integer :reviews_to_make, null: false, default: 0

      t.timestamps null: false
    end
  end
end
