class Lecture < ActiveRecord::Base
  has_many :participations
  has_many :users, :through => :participations
  
  validates :name, :presence => true, :length => { :minimum => 3 }
end
