class CreateJobListings < ActiveRecord::Migration
  def change
    create_table :job_listings do |t|
      t.integer :company_id
      t.string :title
      t.string :description
      t.string :location
      t.string :url
      t.date :date_posted
      t.string :contact

      t.timestamps null: false
    end
  end
end
