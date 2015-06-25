class Treatise < ActiveRecord::Base
  belongs_to :part
  has_many :questions
end
