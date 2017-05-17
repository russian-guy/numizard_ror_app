class UsersController < ApplicationController

    before_action :signed_in_user, only: [:index, :edit, :update]
    before_action :correct_user,   only: [:edit,  :update]

    def new
      @user = User.new
    end

    def index

    end

    def edit
      # @user = User.find(params[:id])
    end

    def show
      @user = User.find(params[:id])
    end

    def create
      @user = User.new(user_params)    # Not the final implementation!
      if @user.save
        flash[:success] = "Готово! Регистрация прошла успешно!"
        if signed_in?
          sign_out
        end
        sign_in     @user
        redirect_to @user
      else
        render 'new'
      end
    end

    def update
      # @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "Готово! Редактирование прошло успешно!"
        redirect_to @user
      else
        render 'edit'
      end
    end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :surname, :birthday, :sex, :city, :street, :house_number, :pavilion_number, :apartment_number, :postcode, :telephone_number)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to sign_in_path, notice: "Войдите для продолжения."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
