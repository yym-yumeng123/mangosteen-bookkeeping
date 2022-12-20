class ValidationCode < ApplicationRecord
  before_create :generate_code
  after_create :send_email
  validates_presence_of :email

  def generate_code
    self.code = SecureRandom.random_number.to_s[2..7]
  end

  def send_email
    UserMailer.welcome_email self.email
  end
end
