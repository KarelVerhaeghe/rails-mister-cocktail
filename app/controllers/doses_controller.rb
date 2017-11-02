class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new({description: dose_params[:description]})
    @dose.ingredient = Ingredient.find(dose_params[:ingredient].to_i)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save!
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient, :description)
  end
end
