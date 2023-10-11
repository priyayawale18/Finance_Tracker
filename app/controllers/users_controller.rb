  class UsersController < ApplicationController

    def my_portfolio
      @tracked_stocks = current_user.stocks
    end

    def my_friends
      @friends = current_user.friends
    end


    def show
      @user = User.find(params[:id])
      @tracked_stocks = @user.stocks
    end

   def search
        if params[:friend].present?
          @friends = User.search(params[:friend])
          @friends = current_user.except_current_user(@friends)
          if @friends
            # Respond to HTML format
            respond_to do |format|
              format.html { render partial: 'users/friend_result' }
          end
          else
              flash[:alert] = "Couldn't find user"
              redirect_to my_friends_path        
          end
        else
            flash[:alert] = "Please enter a friend name or email to search"
            redirect_to my_friends_path 
        end
    end

  end