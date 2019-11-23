class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]

  def index
    @cocktails = Cocktail.all
    @cocktail_new = Cocktail.new
  end

  def show
    @cocktails = Cocktail.all
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktails_path
    else
      redirect_to cocktails_path
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def params_cocktail
    params.require(:cocktail).permit(:name)
  end
end
