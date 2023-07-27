class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    @tweets = @user.tweets
  
    if @user.nil?
      redirect_to root_path, alert: "User not found"
    end

  end
end
