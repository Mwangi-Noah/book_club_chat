class MessagesController < ApplicationController
    before_action :set_book_club
  
    def create
      @message = @book_club.messages.build(message_params)
      @message.user = current_user
      if @message.save
        render json: @message, status: :created
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @message = Message.find(params[:id])
      if @message.update(message_params)
        render json: @message
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @message = Message.find(params[:id])
      @message.destroy
      head :no_content
    end
  
    private
  
    def set_book_club
      @book_club = BookClub.find(params[:book_club_id])
    end
  
    def message_params
      params.require(:message).permit(:content)
    end
  end