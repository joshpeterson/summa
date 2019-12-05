# frozen_string_literal: true

class Part < ApplicationRecord
  belongs_to :summa_theologica
  has_many :treatises
end
