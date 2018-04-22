class AddColumnToFollower < ActiveRecord::Migration[5.1]
  def change
    add_column :followers, :follower_uid, :string
  end
end
