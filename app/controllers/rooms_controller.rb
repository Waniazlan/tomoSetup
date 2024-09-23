class RoomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
   
  end

  def new
    @room = Room.new
 
  end


  def create
    @room = Room.create(name: params["room"]["name"])
    if @room.save
      redirect_to rooms_path # or wherever you want to redirect
    else
      render :new # or handle the error accordingly
    end 
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages
  
    render "index"
  end

  def destroy
    @room = Room.find(params[:id])
    
    if @room.destroy
      redirect_to rooms_path, notice: 'Room and its messages were successfully deleted.'
    else
      redirect_to rooms_path, alert: 'Error deleting room.'
    end
  end
end
