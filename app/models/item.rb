class Item < ApplicationRecord
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations, dependent: :destroy

  belongs_to :user
end
