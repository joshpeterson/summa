# frozen_string_literal: true

class Treatise < ApplicationRecord
  belongs_to :part
  has_many :questions
end
