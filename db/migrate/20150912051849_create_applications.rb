class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :user_id
      t.integer :job_listing_id
      t.string :resume
      t.string :cover_letter
      t.date :date_submitted
      t.string :status
      t.string :contact

      t.timestamps null: false
    end
  end
end
