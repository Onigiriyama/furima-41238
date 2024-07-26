class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'must be full-width characters' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'must be full-width characters' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'must be full-width katakana characters' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'must be full-width katakana characters' }
    validates :birth_day
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'must include both letters and numbers' }

  has_many :items
  has_many :orders
end
