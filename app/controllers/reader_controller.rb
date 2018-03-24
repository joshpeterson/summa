# frozen_string_literal: true

class ReaderController < ApplicationController
  def show
    url = cookies['reader']
    redirect_to(url) unless url.nil?
  end
end
