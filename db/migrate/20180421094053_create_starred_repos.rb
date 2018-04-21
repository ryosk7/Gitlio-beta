class CreateStarredRepos < ActiveRecord::Migration[5.1]
  def change
    create_table :starred_repos do |t|
      t.references :user, foreign_key: true
      t.string :full_name

      t.timestamps
    end
  end
end
