class Api::V1::UsersController < ApplicationController
    def index
        @user = User.all
        render json: @user
      end
    
      def create
        @user = User.create(user_params)
        if @user.valid?
          token = encode_token({user_id: @user.id})
          render json: { user: @user, token: token}
          else
            render json: {error: "Invalid username or password"}
          end
      end

      def login
          @user = User.find_by(username: params[:username])
          if @user && @user.authenticate(params[:password])
              token = encode_token({user_id: @user.id})
              render json: { user: @user, token: token}
          else
            render json: { error: "invalid username or password"}
          end
          
      end
      
    
      def show
        render json: @current_user
      end

      private
      def user_params
          params.permit(:username, :password)
      end
      
end
