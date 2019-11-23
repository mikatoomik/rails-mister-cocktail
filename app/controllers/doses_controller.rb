class DosesController < ApplicationController

  def create
      @dose = Dose.new(params_dose)
      @cocktail = Cocktail.find(params[:cocktail_id])
      @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      redirect_to cocktail_path(@cocktail)
    end
  end

private
  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
