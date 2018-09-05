class Like < ActiveRecord
  belongs_to :micropost, counter_cache: :likes_count
  belongs_to :user
  
end
