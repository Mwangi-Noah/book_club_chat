class ReadingsController < ApplicationController
    before_action :set_reading, only: [:show, :update, :destroy]
  
    def create
      @reading = Reading.new(reading_params)
      if @reading.save
        render json: @reading, status: :created
      else
        render json: @reading.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @reading.update(reading_params)
        render json: @reading
      else
        render json: @reading.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @reading.destroy
      head :no_content
    end
  
    private
  
    def set_reading
      @reading = Reading.find(params[:id])
    end
  
    def reading_params
      params.require(:reading).permit(:user_id, :book_id, :book_club_id)
    end
end