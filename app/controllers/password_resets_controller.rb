class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    @email = params[:email]
    if @email.blank?
      flash.now[:warning] = "メーアドレスを入力してください"
      render :new
    else
      @user = User.find_by(email: params[:email])
      @user&.deliver_reset_password_instructions!
      redirect_to login_path, primary: "メールを送信しました"
    end
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)
    not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)

    return not_authenticated if @user.blank?

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.password_confirmation.blank?
      flash.now[:danger] = "新しいパスワードを入力してください"
      render :edit
    else
      if @user.change_password(params[:user][:password])
        redirect_to login_path, primary: "パスワードを変更できました"
      else
        flash.now[:warning] = "パスワード変更出来ませんでした"
        render :edit
      end
    end
  end
end
