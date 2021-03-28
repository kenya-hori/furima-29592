class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :create]
  before_action :item_find, only:[:index, :create]
  before_action :move_to_index, only:[:index, :create]

  def index
    @order = Order.new
  end

    def create
    @order = Order.new(order_params)
    if @order.valid?
       pay_item
       @order.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city_name, :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

   def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create(
       amount: @item.price,
       card: order_params[:token],
       currency: 'jpy'
     )
   end

   def move_to_index
    redirect_to user_session_path if current_user.id == @item.user_id
  end
end
