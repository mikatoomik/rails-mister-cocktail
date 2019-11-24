class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]

  def index
    @cocktail_new = Cocktail.new
    if params_search && params_search[:query] != ""
      @cocktails = Cocktail.where("name = ?", params_search[:query])
    else
      @cocktails = Cocktail.all
    end
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

  def params_search
    if params.has_key?(:search)
      params.require(:search).permit(:query)
    end
  end

  def params_cocktail
    params.require(:cocktail).permit(:name, :photo)
  end
end
