# frozen_string_literal: true

class TreatisesController < ApplicationController
  def show
    @treatise = treatise
    if @treatise.nil?
      render status: 404
    else
      cookies['reader'] = "/treatises/#{@treatise.id}"
    end
  end

  def treatise
    params.key?(:id) ? Treatise.find(params[:id]) : nil
  end
end
