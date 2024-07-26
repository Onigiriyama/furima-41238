class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :correct_user, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      @order = @item.order
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address)
          .permit(:postal_code, :prefecture_id, :city, :address_line, :building, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def correct_user
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
