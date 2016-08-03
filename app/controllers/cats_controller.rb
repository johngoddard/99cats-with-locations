class CatsController < ApplicationController
  before_action :find_cat, only: [:show, :update, :edit, :destroy]

  def index
    @cats = Cat.all
  end

  def show
  end

  def create
    cat = Cat.new(cat_params)
    if cat.save
      redirect_to cat
    else
      render :new
    end
  end

  def update
    if @cat.update(cat_params)
      redirect_to @cat
    else
      render :edit
    end
  end

  def edit
  end

  def new
    @cat = Cat.new
  end

  def destroy
    flash[:notice] = "Cat is invincible" unless @cat.destroy
    redirect_to cats_url
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :birth_date, :sex, :description, :color, :lat, :long)
  end

  def find_cat
    @cat = Cat.find_by_id(params[:id])
  end
end
