# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :question
  has_one :context
end
