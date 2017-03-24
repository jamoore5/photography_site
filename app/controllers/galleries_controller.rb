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
    @gallery = @category.galleries.new(gallery_params)
    @gallery.order_idx = Gallery.max_order_idx(@category)+1

    if @gallery.save
      redirect_to category_path(@category)
    else
      render 'new'
    end
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

  def move_up
    gallery = Gallery.find(params[:id])
    prev_gallery = Gallery.where(category_id: gallery.category, order_idx: gallery.order_idx-1).first

    prev_gallery.order_idx = gallery.order_idx
    prev_gallery.save

    gallery.order_idx = gallery.order_idx-1
    gallery.save

    redirect_to category_path(gallery.category)
  end

  def move_down
    gallery = Gallery.find(params[:id])
    next_gallery = Gallery.where(category_id: gallery.category, order_idx: gallery.order_idx+1).first

    next_gallery.order_idx = gallery.order_idx
    next_gallery.save

    gallery.order_idx = gallery.order_idx+1
    gallery.save

    redirect_to category_path(gallery.category)
  end

  private
    def gallery_params
      params.require(:gallery).permit(:name)
    end
end
