class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def login
      @user = User.find_by(email: params[:email])
      if @user&.authenticate(params[:password])
        # Generate and return an authentication token
        token = generate_auth_token(@user.id)
        render json: { token: token }
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    def create_book_club
      @book_club = BookClub.new(book_club_params)
      if @book_club.save
        # Add the current user as a member of the newly created book club
        Membership.create(user: current_user, book_club: @book_club)
        render json: @book_club, status: :created
      else
        render json: @book_club.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user.destroy
      head :no_content
    end
  
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  
    def book_club_params
      params.require(:book_club).permit(:name, :description, :reading_schedule)
    end
  
    def generate_auth_token(user_id)
      # Generate and return an authentication token based on user_id
      # You can use a token generation library or implement your own logic here
      # This token can be used for authentication in subsequent requests
      # For simplicity, this example returns a random string as the token
      SecureRandom.hex(32)
    end
  end
class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
  
    def index
      @users = User.all
      render json: @users
    end
  
    def show
      render json: @user
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user.destroy
      head :no_content
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
