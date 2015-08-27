class Context < ActiveRecord::Base
  belongs_to :article
  belongs_to :part
  belongs_to :treatise
  belongs_to :question
end
