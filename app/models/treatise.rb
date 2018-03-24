# frozen_string_literal: true

class Treatise < ActiveRecord::Base
  belongs_to :part
  has_many :questions
end
