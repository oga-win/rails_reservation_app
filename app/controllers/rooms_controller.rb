class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:posts, :show, :index]

  def posts
    @rooms = Room.all
    @reservation = Reservation.all
  end
  
  def index
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :image))
    if @room.save
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to "/rooms/posts"
    else
      render "new"
    end
  end
  
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    @reservations = Reservation.where(room_id: @room.id)
  end
  
  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :introduction, :price, :address, :image))
      flash[:notice] = "情報更新しました"
      redirect_to "/rooms/posts"
    else
      render "edit"
    end
  end
  
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "部屋情報を削除しました"
    redirect_to "/rooms/posts" 
  end
end
