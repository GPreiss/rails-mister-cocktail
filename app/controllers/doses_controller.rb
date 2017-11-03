class DosesController < ApplicationController
before_action :find_cocktail, only: [:show, :new, :create]
  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.create(dose_params)
    if @dose.save
      redirect_to cocktail_path(id: @cocktail.id)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to :back
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  private
  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
