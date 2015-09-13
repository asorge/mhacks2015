class ChangeDataType < ActiveRecord::Migration
  def change
  	change_column :user_interests, :rating, :integer
  end
end
