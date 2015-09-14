class OutlineController < ApplicationController
  def show
    @summa = get_summa
  end

  def get_summa
    SummaTheologica.first
  end
end
