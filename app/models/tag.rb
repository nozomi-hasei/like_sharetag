class Tag < ApplicationRecord
  has_many :tag_user_relation
  has_many :user
end
