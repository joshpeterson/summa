# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :treatise
  has_many :articles
end
