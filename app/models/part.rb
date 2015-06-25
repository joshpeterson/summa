class Part < ActiveRecord::Base
  belongs_to :summatheologica
  has_many :treatises
end
