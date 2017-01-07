class SummaController < ApplicationController
  def show
    @summa = summa
  end

  def summa
    SummaTheologica.first
  end
end
