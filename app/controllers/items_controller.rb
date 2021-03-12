class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.includes(:user).find(params[:id])
  end

  def edit
  end

  def update
    
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :condition_id, :delivery_fee_burden_id, :prefecture_id,
                                 :day_to_ship_id, :image).merge(user_id: current_user.id)
  end
end
