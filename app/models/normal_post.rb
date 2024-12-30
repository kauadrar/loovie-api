class NormalPost < ApplicationRecord
  has_one :post, as: :content

  has_many_attached :medias
end
