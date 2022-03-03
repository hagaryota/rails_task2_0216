class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.all.order(updated_at: 'DESC')
    binding.pry
  end

  def new
    @room = Room.find(params[:format])
    @reservation = Reservation.new
  end

  def confirm
    @reservation = Reservation.new(reservations_params)
		if @reservation.invalid?
       @room = Room.find(@reservation.room_id)
			 render new_reservations_path
		else
       redirect_to comprete_reservation_path(@reservation.id)
    end
  end

  def create
    @reservation = Reservation.new(reservations_params)
    @reservation.user_id = current_user_id
    if @reservation.save
      flash[:notice] = "新規予約を登録しました"
      redirect_to comprete_reservation_path(@reservation.id)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def comprete
    @reservation = Reservation.find(params[:id])
  end

  def reservations_params
    params.require(:reservation).permit(:start_date, :end_date, :persons, :current_user_id, :room_id, :reservation_id, :totalprice, :days)
  end
end