class User < ApplicationRecord
  has_one :wallet, as: :model, dependent: :destroy
  attr_accessor :password

  def authenticate(plain_password)
    return false if plain_password.blank?

    hashed_password = Digest::SHA256.hexdigest(plain_password)
    hashed_password == password_digest
  end

  before_save :encrypt_password

  private

  def encrypt_password
    if password.present?
      self.password_digest = Digest::SHA256.hexdigest(password)
    end
  end

end
