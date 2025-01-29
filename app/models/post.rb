class Post < ApplicationRecord
  belongs_to :user
  has_one :content, dependent: :destroy
end
