class CreateUserInterests < ActiveRecord::Migration
  def change
    create_table :user_interests do |t|
      t.integer :company_id
      t.integer :user_id
      t.decimal :rating

      t.timestamps null: false
    end
  end
end
