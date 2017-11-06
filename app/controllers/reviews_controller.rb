class ReviewsController < ApplicationController
  def index
    @cocktail = set_cocktail
    @reviews = Review.all
  end

  def new
    @cocktail = set_cocktail
    @review = Review.new
  end

  def create
    @cocktail = set_cocktail
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    if @review.save!
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end


  private

  def review_params
    params.require(:review).permit(:content)
  end

  def set_cocktail #because this param comes from somewhere elese , the url instead of the form
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
