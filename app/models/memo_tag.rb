class MemoTag 

  include ActiveModel::Module 
  attr_accessor :memo, :name
    
  with_options presence: true do
    validates :memo
    validates :tag
  end

  def save
    memo = Memo.create(memo_content: memo_content)
    tag = Tag.create(tag_name: tag_name)

    MemoTagRelation.create(memo_id: memo.id, tag_id: tag.id)
  end
end