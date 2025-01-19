class PasswordsController < ApplicationController
  include Components::PaginationHelper

  before_action :authenticate_user!
  before_action :set_password, only: %i[ show edit update destroy ]

  # GET /passwords or /passwords.json
  def index
    @passwords = current_user.passwords.order(created_at: :desc).page(params[:page]).per(10)

    @pagination = {
      prev_page: @passwords.prev_page,
      next_page: @passwords.next_page,
      current_page: @passwords.current_page,
      pages_to_display: pagination_with_ellipsis(@passwords.current_page, @passwords.total_pages)
    }
  end

  # GET /passwords/1 or /passwords/1.json
  def show
  end

  # GET /passwords/new
  def new
    @password = Password.new
  end

  # GET /passwords/1/edit
  def edit
  end

  # POST /passwords or /passwords.json
  def create
    @password = Password.new(password_params)
    @password.user_passwords.new(user: current_user, role: :owner)

    respond_to do |format|
      if @password.save
        format.html { redirect_to @password, notice: "Password was successfully created." }
        format.json { render :show, status: :created, location: @password }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passwords/1 or /passwords/1.json
  def update
    respond_to do |format|
      if @password.update(password_params)
        format.html { redirect_to @password, notice: "Password was successfully updated." }
        format.json { render :show, status: :ok, location: @password }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passwords/1 or /passwords/1.json
  def destroy
    @password.destroy!

    respond_to do |format|
      format.html { redirect_to passwords_path, status: :see_other, notice: "Password was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_password
      @password = current_user.passwords.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def password_params
      params.require(:password).permit(:url, :username, :password)
    end
end
