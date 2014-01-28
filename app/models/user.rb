class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :participations
  has_many :lectures, :through => :participations
  has_many :explanations
  has_many :topics, :through => :explanations
  has_many :supports
  has_many :questions, :through => :supports
  has_many :comments
  
  validates :name, :presence => true, :length => { :minimum => 3 }
end
