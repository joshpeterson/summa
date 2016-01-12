class OutlineController < ApplicationController
  def show
    @summa = get_summa
    render :layout => "outline"
  end

  def get_summa
    SummaTheologica.first
  end
end
