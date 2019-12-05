# frozen_string_literal: true

class Context < ApplicationRecord
  belongs_to :article
  belongs_to :part
  belongs_to :treatise
  belongs_to :question
end
