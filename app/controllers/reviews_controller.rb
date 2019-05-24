class ReviewsController < ApplicationController
  before_action :set_cocktail, only: [:create]

  def create
    @review = Review.new(review_params)

    @review.cocktail = @cocktail

    if @review.save
      redirect_to @cocktail, notice: 'Review was successfully added.'
    else
      render 'cocktails/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
