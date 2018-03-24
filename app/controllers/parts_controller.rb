# frozen_string_literal: true

class PartsController < ApplicationController
  def show
    @part = part
    if @part.nil?
      render status: 404
    else
      cookies['reader'] = "/parts/#{@part.id}"
    end
  end

  def part
    params.key?(:id) ? Part.find(params[:id]) : nil
  end
end
