class User < ApplicationRecord
  attr_accessor :remember_token
  before_save :downcase_email, :strip_whitespace
  
  NAME_REGEX = /\A[\w\s]+\z/i
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name,  presence: true,
                    format: {with: NAME_REGEX},
                    length: {maximum: 50}
  validates :email, presence: true,
                    format: {with: EMAIL_REGEX},
                    uniqueness: true,
                    length: {maximum: 255}
  validates :password, presence: true,
                      length: {minimum: 6},
                      allow_nil: true
  has_secure_password
  has_many :posts
  def User.digest(string)
    Digest::SHA384.hexdigest(string)
  end

  def User.bcrypt_digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest,User.digest(remember_token))
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end

  def downcase_email
    self.email.downcase!
  end

  def strip_whitespace
    self.email.strip!
    self.name.strip!
  end

end
