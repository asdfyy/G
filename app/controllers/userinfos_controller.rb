class UserinfosController < ApplicationController
  def show
    @user = current_user
    @addresses = Address.all
  end
end
