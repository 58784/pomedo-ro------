class UserSessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to top_path
      render :new
    end
  end

  def destroy
    logout
    redirect_to top_path
  end
end