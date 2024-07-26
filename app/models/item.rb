class Item < ApplicationRecord
  belongs_to        :user
  has_one_attached  :image

  validates :image,             presence: true
  validates :name,              presence: true
  validates :price,             presence: true,
                                numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :comment,           presence: true
  validates :category_id,       presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_payer_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,     presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id,   presence: true, numericality: { other_than: 1, message: "can't be blank" }

  # カテゴリーなどのアクティブハッシュを利用する場合の設定
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_payer
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one :order
end
