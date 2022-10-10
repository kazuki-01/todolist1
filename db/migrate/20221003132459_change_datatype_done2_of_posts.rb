class ChangeDatatypeDone2OfPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :done, :boolean, default: false, null: false
  end
end
