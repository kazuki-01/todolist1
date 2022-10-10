class ChangeDatatypeDoneOfPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :done, :boolean, default: false, nill: false
  end
end
