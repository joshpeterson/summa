class SummaController < ApplicationController
  def index
    @summa = get_summa
  end

  def get_summa
    SummaTheologica.first
  end
end
