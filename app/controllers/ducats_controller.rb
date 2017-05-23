class DucatsController < ApplicationController

    before_action :signed_in_user_admin, only: [:create,  :new, :update, :destroy]

    def new
      @ducat = Ducat.new
    end

    def show
      @ducat    = Ducat.find(params[:id])
      @pictures = @ducat.pictures
    end

    def edit
      @ducat = Ducat.find(params[:id])
    end

    def create
      @ducat = Ducat.new(ducat_params)    # Not the final implementation!
      if @ducat.save

        if params[:images]
          params[:images].each { |image|
            @ducat.pictures.create(image: image)
          }
        end

        flash[:success] = "Готово! Эталон создан успешно!"
        redirect_to @ducat
      else
        render 'new'
      end
    end

    def update
      @ducat = Ducat.find(params[:id])
      if @ducat.update_attributes(ducat_params)
        flash[:success] = "Готово! Редактирование эталона прошло успешно!"
        redirect_to @ducat
      else
        render 'edit'
      end
    end

    def destroy
      Ducat.find(params[:id]).destroy
      flash[:success] = "Эталон уничтожен!"
      redirect_to root_path
    end

  private

    def ducat_params
      params.require(:ducat).permit(:name, :mean_price, :material, :weight, :diameter, :rating, :publish_year, :mint, :set, :description, :pictures)
    end

    def signed_in_user_admin
      unless signed_in_admin?
        store_location
        redirect_to root_path, notice: "Страница доступна только для админов."
      end
    end


end
