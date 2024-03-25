class Post < ApplicationRecord
  validates :title, presence: true
  validates :img_url, presence: true
end
