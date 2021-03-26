class ReservationsController < ApplicationController
    def index
        @users = User.all
        @reservations = Reservation.all
        @rooms = Room.all
    end
    
    def new
        
    end
    
    def confirm
        @room = Room.find(params[:id])
        @reservation = Reservation.find(params[:id])
    end
    
    def create
        @reservations = Reservation.new(params.require(:reservation).permit(:start_date, :last_date, :people, :room_id))
        @reservations.user_id = current_user.id
        if @reservations.save
            flash[:notice] = "部屋を新規予約しました"
            redirect_to "/reservations"
        else
            render "show"
        end
    end
    
    def show
        @reservation = Reservation.find(params[:id])
        @rooms = Room.find_by(id: @reservation.room_id)
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
        flash[:notice] = "部屋情報を削除しました"
        redirect_to "/reservations" 
    end
end
