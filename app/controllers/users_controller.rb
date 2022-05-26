class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :set_user, only: %i[edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path, info: "ユーザーを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path(current_user), info: "アカウントを更新しました"
    else
      flash.now[:warning] = "アカウントを更新できませんでした"
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to root_path, danger: "アカウントを削除しました"
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
