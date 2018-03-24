# frozen_string_literal: true

class OutlineController < ApplicationController
  def show
    @summa = summa
    render layout: 'outline'
  end

  def summa
    SummaTheologica.first
  end
end
