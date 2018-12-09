# frozen_string_literal: true

class PartsController < ApplicationController
  def show
    @part = part
    if @part.nil?
      render status: :not_found
    else
      cookies['reader'] = "/parts/#{@part.id}"
    end
  end

  def part
    params.key?(:id) ? Part.find(params[:id]) : nil
  end
end
