class ReservationsController < ApplicationController
  def rooms
    @room = Room.find(params[:id])
  end
end
