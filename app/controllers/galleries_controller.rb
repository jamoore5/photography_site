class GalleriesController < ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @gallery = @category.galleries.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @gallery = @category.galleries.new
  end

  def edit
    @category = Category.find(params[:category_id])
    @gallery = @category.galleries.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
    @gallery = @category.galleries.create(gallery_params)
    redirect_to category_path(@category)
  end

  def update
    @category = Category.find(params[:category_id])
    @gallery = @category.galleries.find(params[:id])

    if @gallery.update(gallery_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @gallery = @category.galleries.find(params[:id])
    @gallery.destroy
    redirect_to category_path(@category)
  end

  private
    def gallery_params
      params.require(:gallery).permit(:name)
    end
end
