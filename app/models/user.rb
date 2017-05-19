class User < ApplicationRecord

    before_save   { self.email = email.downcase }
    before_create :create_remember_token

    validates(:name, length: { maximum: 50, message: " - слишком длинное [Имя] (50 символов - максимум)"})
    validates(:name, :presence => { :message => " - поле [Имя] обязательно для заполнения" })

    VALID_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates(:email, format: { with: VALID_EMAIL_REGEXP, message: " - недействительный [E-mail адрес]"})
    validates(:email, uniqueness: { case_sensitive: false, message: " - [E-mail адрес] уже занят"})
    validates(:email, :presence => { :message => " - поле [E-mail адрес] обязательно для заполнения" })

    has_secure_password
    validates(:password, length: { minimum: 6, message: " - слишком короткий [Пароль] (6 символов - минимиум)"})
    validates(:password, :presence => { :message => " - поле [Пароль] обязательно для заполнения" })

    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, default_url: "missing.png"
    validates_attachment_content_type(:avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"])

    validates(:sex, :presence => { :message => " - поле [Пол] обязательно для заполнения" })

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
