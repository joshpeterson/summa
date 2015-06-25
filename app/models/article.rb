class Article < ActiveRecord::Base
  belongs_to :question
  has_many :objections
end
