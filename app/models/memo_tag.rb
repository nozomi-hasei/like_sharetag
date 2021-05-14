class MemoTag 

  include ActiveModel::Model 
  attr_accessor :tag_name, :memo_content, :user_id
    
  with_options presence: true do
    validates :tag_name
    validates :memo_content
  end

  def save
    memo = Memo.create(memo_content: memo_content, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    MemoTagRelation.create(memo_id: memo.id, tag_id: tag.id)
  end
end