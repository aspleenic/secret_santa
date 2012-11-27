class User < ActiveRecord::Base
  attr_accessible :address2, :admin, :city, :email, :fname, :likes, :lname, :postal_code, :state_province, :street_address, :password_confirmation
  
  validates_presence_of :email
  validates_uniqueness_of :email
  # validates_confirmation_of :password
  # validate :password_non_blank 
  
  def self.authenticate(name, password) 
    user = self.find_by_name(name)
    if user
      expected_password = encrypted_password(password, user.salt) 
      if user.hashed_password != expected_password
        user = nil 
      end
    end
    user
  end
  
  def password 
    @password
  end
  
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  
  private
  
    def create_new_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
  
    def password_non_blank 
      errors.add_to_base("Missing password" ) if hashed_password.blank?
    end
    
    def self.encrypted_password(password, salt) 
      string_to_hash = password + Time.now + salt 
      Digest::SHA1.hexdigest(string_to_hash)
    end
    
end
