class MemosController < ApplicationController
  
  def index
    @memos = Memo.all.order(created_at: :desc)
  end

  def new
    @memo = MemoTag.new
  end

  def create
    @memo = MemoTag.new(memo_params)
    if @memo.valid?
      @memo.save
      return redirect_to root_path
    else
      render "new"
    end
  end

    private
    def memo_params
      params.require(:memo_tag).permit(:tag_name, :memo_content)
    end
end
