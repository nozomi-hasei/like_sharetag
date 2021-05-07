class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  #テーブルに追加したカラムの許可
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :nickname])
  end
  
  #ユーザー登録バリデーション
  with_options presence: true do
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
      validates :name
    end 
    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :name_kana
    end 
    validates :nickname 
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "can't be registered"}
  end
end

