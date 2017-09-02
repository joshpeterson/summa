class Article < ActiveRecord::Base
  belongs_to :question
  has_one :context
end
