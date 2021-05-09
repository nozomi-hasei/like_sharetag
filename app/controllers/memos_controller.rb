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
      @mome.save
      return redirect_to root_path
    else
      render "new"
    end
  end

    private
    def memo_params
      params.require(:memo_tag).permit(:memo, :tag)
    end
end
