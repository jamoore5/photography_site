class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    @category.order_idx = Category.max_order_idx+1

    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  def move_up
    category = Category.find(params[:id])
    prev_category = Category.where(order_idx: category.order_idx-1).first

    prev_category.order_idx = category.order_idx
    prev_category.save

    category.order_idx = category.order_idx-1
    category.save

    redirect_to categories_path
  end

  def move_down
    category = Category.find(params[:id])
    next_category = Category.where(order_idx: category.order_idx+1).first

    next_category.order_idx = category.order_idx
    next_category.save

    category.order_idx = category.order_idx+1
    category.save

    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
