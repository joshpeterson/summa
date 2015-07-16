class ArticlesController < ApplicationController
  def show
    @article = get_article
    if (@article == nil)
      render :status => 404
    end
  end

  def get_article
    params.has_key?(:id) ? Article.find(params[:id]) : nil
  end
end
