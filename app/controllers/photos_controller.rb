class PhotosController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.new
  end

  def edit
    @category = Category.find(params[:category_id])
    @gallery = Gallery.find(params[:gallery_id])
    @photo = Photo.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @gallery = Gallery.find(params[:gallery_id])
    @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      redirect_to category_gallery_path(@gallery.category, @gallery)
    else
      render 'edit'
    end
  end

  def create
    @category = Category.find(params[:category_id])
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.new(photo_params)

    if @photo.save
      redirect_to category_gallery_path(@gallery.category, @gallery)
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @gallery = Gallery.find(params[:gallery_id])
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to category_gallery_path(@category, @gallery)
  end

  private

    def photo_params
      params.require(:photo).permit(:image, :caption, :public)
    end
end
