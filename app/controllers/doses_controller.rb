class DosesController < ApplicationController
  def new
    set_cocktail
    @ingredients = Ingredients.all - @cocktail.ingredients
    @dose = Dose.new
  end

  def create
    @cocktail = set_cocktail
    @dose = Dose.new({description: dose_params[:description]})
    @dose.ingredient = Ingredient.find(dose_params[:ingredient_id])
    @dose.cocktail = @cocktail
    if @dose.save!
      redirect_to cocktail_path(@cocktail)
    else
      @ingredients = Ingredients.all - @cocktail.ingredients
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end

  def set_cocktail #because this param comes from somewhere elese , the url instead of the form
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
