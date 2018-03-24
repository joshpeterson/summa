# frozen_string_literal: true

class Question < ActiveRecord::Base
  belongs_to :treatise
  has_many :articles
end
