class Post < ApplicationRecord
validates :title, presence: true
validates :user_id, presence: true

def user
  User.find(id: self.user_id)
end

#Tweetは一つのUserに所属しています(Tweet belongs to a User.) 。
#belongs_to :user  # これを追加

end
