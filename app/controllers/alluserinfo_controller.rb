class AlluserinfoController < ApplicationController
  def index 
    @user = User.all.reverse_order
    @addresses = Address.all.reverse_order
end
end
