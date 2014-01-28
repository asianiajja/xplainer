class Topic < ActiveRecord::Base
  belongs_to :lecture
  has_many :explanations
  has_many :users, :through => :explanations
  has_many :comments
  belongs_to :question
  
  validates :name, :presence => true
  
  def editor
    Explanation.where(:author => true, :topic_id => self.id).first.user
    
  end

  
end
