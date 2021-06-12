class UsersController < ApplicationController

  def show
    @user = User.find(perams[:id])
    @user_notes = @user.notes
  end

end
