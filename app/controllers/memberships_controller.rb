class MembershipsController < ApplicationController
    before_action :set_membership, only: [:destroy]
  
    def create
      @membership = Membership.new(membership_params)
      if @membership.save
        render json: @membership, status: :created
      else
        render json: @membership.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @membership.destroy
      head :no_content
    end
  
    private
  
    def set_membership
      @membership = Membership.find(params[:id])
    end
  
    def membership_params
      params.require(:membership).permit(:user_id, :book_club_id)
    end
end