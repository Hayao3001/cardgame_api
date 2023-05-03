module Api
    module V1    
        class RoomsController < ApplicationController
            def index
                rooms = Room.order(created_at: :desc)
                render json: { status: 'SUCCESS', message: 'Loaded room', data: rooms }
            end

            def show
                render json: { status: 'SUCCESS', message: 'Loaded the room', data: @room }
            end

            def create
                room = Room.new(room_params)
                if room.save
                  render json: { status: 'SUCCESS', data: room }
                else
                  render json: { status: 'ERROR', data: room.errors }
                end
            end

            def destroy
                @room.destroy
                render json: { status: 'SUCCESS', message: 'Deleted the room', data: @room }
            end

            def update
                if @room.update(room_params)
                  render json: { status: 'SUCCESS', message: 'Updated the room', data: @room }
                else
                  render json: { status: 'SUCCESS', message: 'Not updated', data: @room.errors }
                end
              end

            private

            def set_rooms
                @room = Room.find(params[:id])
            end

            def room_params
                params.require(:room).permit(:name)
            end
        end
    end
end
