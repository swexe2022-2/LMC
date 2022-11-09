class User < ApplicationRecord
    validates :password, presence: true, confirmation: true
    validates :name, presence: true
    
    attr_accessor :password, :password_confirmation
    
    def password=(val)
        if val.present?
            self.pass = BCrypt::Password.create(val)
        end
        @password = val
    end
    
end
