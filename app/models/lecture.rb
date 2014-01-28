class Lecture < ActiveRecord::Base
  has_many :participations
  has_many :users, :through => :participations
  has_many :topics
  has_many :questions

  validates :name, :presence => true
  
  attr_accessor :password
  
  before_save :encrypt_password
  after_save :clear_password
  
  def encrypt_password    
    if @password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(self.password, self.salt)

    end
  end

  
  def clear_password
    self.password = nil
  end
end