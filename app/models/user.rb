class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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


  has_many :tag_user_relation
  has_many :tags
end
