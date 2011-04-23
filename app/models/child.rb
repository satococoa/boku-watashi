class Child < ActiveRecord::Base
  belongs_to :user
  attr_accessible :childname, :nickname, :password, :password_confirmation
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :childname, :presence => true, :uniqueness => true
  
  def self.authenticate(childname, password)
    user = find_by_childname(childname)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def child?
    true
  end

  def parent?
    false
  end
end
