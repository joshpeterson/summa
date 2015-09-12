class TreatisesController < ApplicationController
  def show
    @treatise = get_treatise
    if (@treatise == nil)
      render :status => 404
    else
      cookies["reader"] = "/treatises/#{@treatise.id}"
    end
  end

  def get_treatise
    params.has_key?(:id) ? Treatise.find(params[:id]) : nil
  end
end
