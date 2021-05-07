class Memo < ApplicationRecord
  has_many :memo_tag_relations
  has_many :tags, through: :memo_tag_relations
end
