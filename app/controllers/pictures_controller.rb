class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(params[:picture])

    if @picture.save
      flash[:success] = "Изображения загружены успешно!"
    else
      flash[:error] = "Некоторые изображения загрузить не удалось!"
    end
  end


  private

  def picture_params
    params.require(:picture).permit(:description, :gallery_id, :image)
  end

end
