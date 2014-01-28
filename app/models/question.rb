class Question < ActiveRecord::Base
  belongs_to :lecture
  has_many :topics
  has_many :supports
  has_many :users, :through => :supports
end
