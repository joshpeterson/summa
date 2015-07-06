class PartsController < ApplicationController
  def show
    @part = get_part
    if (@part == nil)
      render :status => 404
    end
  end

  def get_part
    params.has_key?(:id) ? Part.find(params[:id]) : nil
  end
end
