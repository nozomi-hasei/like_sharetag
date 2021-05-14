class Tag < ApplicationRecord
  has_many :memo_tag_relations
  has_many :memos, through: :memo_tag_relations

  validates :tag_name, uniqueness: true
end
