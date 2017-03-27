class PhotosController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.new
  end

  def create
    @category = Category.find(params[:category_id])
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.new(photo_params)

    if @photo.save
      redirect_to category_gallery_path(@category, @gallery)
    else
      render 'new'
    end
  end

  private

    def photo_params
      params.require(:photo).permit(:image, :caption)
    end
end
