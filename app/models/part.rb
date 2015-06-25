class Part < ActiveRecord::Base
  belongs_to :summa_theologica
  has_many :treatises
end
