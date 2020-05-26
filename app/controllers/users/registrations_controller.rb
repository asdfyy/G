# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end


  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(sign_up_params)
  #   unless @user.valid?
  #     flash.now[:alert] = @user.errors.full_messages
  #     # render :signup1 and return
  #     render :new and return
  #   end
  #   session[:nickname] = params[:user][:nickname]
  #   session[:email] = params[:user][:email]
  #   session[:password] = params[:user][:password]
  #   session[:password_confirmation] = params[:user][:password_confirmation]
  #   session[:f_name_kana] = params[:user][:f_name_kana]
  #   session[:l_name_kana] = params[:user][:l_name_kana]
  #   session[:f_name_kanji] = params[:user][:f_name_kanji]
  #   session[:l_name_kanji] = params[:user][:l_name_kanji]
  #   session[:birthday] = birthday_join
  #   session[:provider] = session[:provider]
  #   session[:uid] = session[:uid]
  #   @user = User.create(nickname:session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], f_name_kana: session[:f_name_kana],l_name_kana: session[:l_name_kana], f_name_kanji: session[:f_name_kanji], l_name_kanji: session[:l_name_kanji], birthday: session[:birthday], tel: params[:user][:tel])
  #   # render :new2
  # end

  # def create_address
  #   if session[:provider].present? && session[:uid].present?#もしoath認証されていたら
  #     password = Devise.friendly_token.first(7)
  #     @user = User.create(nickname:session[:nickname], email: session[:email], password: "password", password_confirmation: "password", f_name_kana: session[:f_name_kana],l_name_kana: session[:l_name_kana], f_name_kanji: session[:f_name_kanji], l_name_kanji: session[:l_name_kanji], birthday: session[:birthday], tel: params[:user][:tel])
  #     sns = SnsCredential.create(user_id: @user.id,uid: session[:uid], provider: session[:provider])
  #   else#email認証だったら
  #     @user = User.create(nickname:session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], f_name_kana: session[:f_name_kana],l_name_kana: session[:l_name_kana], f_name_kanji: session[:f_name_kanji], l_name_kanji: session[:l_name_kanji], birthday: session[:birthday], tel: params[:user][:tel])
  #   end


  #   if @user.save
  #     redirect_to controller: '/addresses', action: 'step3'
  #     sign_in(@user)
  #     bypass_sign_in(@user)
  #   else
  #     render "step1"
      
  #   end
  # end

  # protected

  # def address_params
  #   params.require(:address).permit(:zipcode, :prefecture, :city, :address, :building)
  # end
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
      redirect_to signup_index_path, notice: '初めから入れ直してください'
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
