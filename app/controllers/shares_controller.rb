class SharesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_password

  def new
    @user_password = UserPassword.new
  end

  def create
    @user_password = @password.user_passwords.new(user_password_params)

    respond_to do |format|
      if @user_password.save
        format.html { redirect_to @password, notice: "Share was successfully created." }
        format.json { render :show, status: :created, location: @password }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @password.user_passwords.where(user_id: params[:id]).destroy_all

    respond_to do |format|
      format.html { redirect_to @password, status: :see_other, notice: "Password was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_password
    @password = current_user.passwords.find(params[:password_id])
  end

  def user_password_params
    params.require(:user_password).permit(:user_id, :role)
  end
end
