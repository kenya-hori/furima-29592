class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_id, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

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
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :condition_id, :delivery_fee_burden_id, :prefecture_id,
                                 :day_to_ship_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to user_session_path unless current_user.id == @item.user_id
  end

  def find_id
    @item = Item.find(params[:id])
  end
end
