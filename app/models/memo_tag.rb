class MemoTag 

  include ActiveModel::Model 
  attr_accessor :tag_name, :memo_content
    
  with_options presence: true do
    validates :tag_name
    validates :memo_content
  end

  def save
    tag = Tag.create(tag_name: tag_name)
    memo = Memo.create(memo_content: memo_content)

    MemoTagRelation.create(tag_id: tag.id, memo_id: memo.id)
  end
end