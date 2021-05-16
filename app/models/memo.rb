class Memo < ApplicationRecord
  has_many :memo_tag_relations, dependent: :destroy
  has_many :tags, through: :memo_tag_relations
  belongs_to :user
end
