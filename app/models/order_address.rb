class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :address_line, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを含む7桁の形式で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address_line
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁の数字で入力してください' }
    validates :token
  end

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(
      postal_code:,
      prefecture_id:,
      city:,
      address_line:,
      building:,
      phone_number:,
      order_id: order.id
    )
  end
end
