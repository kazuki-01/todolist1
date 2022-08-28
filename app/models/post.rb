class Post < ApplicationRecord
validates :title, presence: true

#Tweetは一つのUserに所属しています(Tweet belongs to a User.) 。
#belongs_to :user  # これを追加

end
