require 'digest/sha1'

class User < ActiveRecord::Base
 #  include RFC822


  has_many :todo_lists ,  :dependent => :destroy
  has_many :todos, :through =>:todo_lists


  validates_presence_of     :name
  validates_uniqueness_of   :name

 #todo:  fix the problem with the RMC822 Lib.  So we can turn the check for email address formating
 # validates_format_of :name,
 #   :with => EmailAddress,
 #   :message=> 'must be a valid email address. i.e. user@doman.com'

  
  validates_confirmation_of :password

  validate :password_non_blank

  
  attr_accessor :password_confirmation, :password

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

  
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end


  def User.after_destroy
    if User.count.zero?
      raise "Can't delete last user"
    end
  end


  private

  def password_non_blank
    errors.add(:password, "Missing password") if hashed_password.blank?
  end



  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end



  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
  
  
end
