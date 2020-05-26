class SignupController < ApplicationController
  # 各アクションごとに新規インスタンスを作成します
  # 各アクションごとに、遷移元のページのデータをsessionに保管していきます
def step1
  @user = User.new # 新規インスタンス作成
end

def step2
  # step1で入力された値をsessionに保存
  session[:email] = user_params[:email]
  session[:password] = user_params[:password]
  session[:password_confirmation] = user_params[:password_confirmation]
  session[:fname] = user_params[:fname]
  session[:lname] = user_params[:lname]
  session[:fnamekana] = user_params[:fnamekana]
  session[:lnamekana] = user_params[:lnamekana]
  session[:phonenumber] = user_params[:phonenumber]
  @user = User.new # 新規インスタンス作成
end

def create
  @user = User.new(
    email: session[:email],# sessionに保存された値をインスタンスに渡す
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    fname: session[:fname], 
    lname: session[:lname], 
    fnamekana: session[:fnamekana], 
    lnamekana: session[:lnamekana], 
    age: session[:age], 
    phonenumber: session[:phonenumber], 
  )
  if @user.save
      # ログインするための情報を保管
    session[:id] = @user.id
    redirect_to done_signup_index_path
  else
    redirect_to signup2_path, notice: '初めから入れ直してください'
  end
end

def done
  sign_in User.find(session[:id]) unless user_signed_in?
end

private
  def user_params
    params.permit(
      :email, 
      :password, 
      :password_confirmation, 
      :fname, 
      :lname, 
      :fnamekana, 
      :lnamekana, 
      :age, 
      :phonenumber, 
      :zipcode, 
      :prefecture, 
      :city, 
      :address, 
      :building, 
    )
  end
end
