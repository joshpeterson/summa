class ReaderController < ApplicationController
  def show
    url = cookies["reader"]
    if (!url.nil?)
      redirect_to(url)
    end
  end
end
