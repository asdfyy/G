class AlluserinfoController < ApplicationController
  def index 
    @user = User.all
    @addresses = Address.all
end
end
