class UsersController < ApplicationController

  def show

    @user = User.find(params[:id])
    @user_notes = @user.notes
  end
  

end
