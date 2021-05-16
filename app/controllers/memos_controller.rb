class MemosController < ApplicationController
  before_action :authenticate_user!

  def index
    @memos = Memo.all.order(created_at: :desc)
  end

  def new
    @memo = MemoTag.new
  end

  def create
    @memo = MemoTag.new(memo_params)
    @memo.user_id = current_user.id
    if @memo.valid?
      @memo.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  def destroy
    memo = Memo.find(params[:id])
    if memo.destroy
      return redirect_to root_path
    else
      render "new"
    end
  end


  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"])
    render json:{ keyword: tag }
  end

  private
  def memo_params
    params.require(:memo_tag).permit(:memo_content, :tag_name).merge(user_id: current_user.id)
  end
end

