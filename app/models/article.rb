class Article < ActiveRecord::Base
  belongs_to :question
  has_many :objections
  has_one :context
end
