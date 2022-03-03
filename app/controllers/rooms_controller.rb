class RoomsController < ApplicationController
  before_action :search

  def search
    @q = Room.ransack(params[:q])
    @search = @q.result
    @count = @search.count
  end

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduce, :price, :address, :image))
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to :rooms
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :introduce, :price, :address, :image))
      flash[:notice] = "「#{@room.name}」の情報を更新しました"
      redirect_to :rooms
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "#{@room.name}」の情報を削除しました"
    redirect_to :rooms
  end

end
