class DucatsController < ApplicationController

    def new
      @ducat = Ducat.new
    end

    def create
      @ducat = Ducat.new(ducat_params)    # Not the final implementation!
      if @ducat.save
        flash[:success] = "Готово! Эталон создан успешно!"
        redirect_to @ducat
      else
        render 'new'
      end
    end

  private

    def ducat_params
      params.require(:name).permit(:mean_price, :material, :weight, :diameter, :rating, :publish_year, :mint, :set, :description)
    end


end
