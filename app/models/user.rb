class User < ApplicationRecord

    before_save   { self.email = email.downcase }
    before_create :create_remember_token

    validates(:name, presence: true, length: { maximum: 50 })

    VALID_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates(:email, presence: true, format: { with: VALID_EMAIL_REGEXP }, uniqueness: { case_sensitive: false })

    has_secure_password
    validates(:password, length: { minimum: 6 })

    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, default_url: "missing.png"
    validates_attachment_content_type(:avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"])

    def User.new_remember_token
      SecureRandom.urlsafe_base64
    end

    def User.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
    end

  private

    def create_remember_token
        self.remember_token = User.encrypt(User.new_remember_token)
    end

end
