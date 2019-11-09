class GamessController < ApplicationController
  def index
    #code
  end

  def show
    @user = User.find(paramss[:id])
  end
end
