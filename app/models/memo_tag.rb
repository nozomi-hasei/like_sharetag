class MemoTag 

  include ActiveModel::module 
  attr_accessor :memo, :name
    
  with_options presence: true do
    validates :memo
    validates :name
  end

  def save
    memo = Memo.create()
  end
end