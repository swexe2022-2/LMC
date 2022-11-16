class User < ApplicationRecord
    validates :password, presence: true, confirmation: true
    validates :name, presence: true
    
    attr_accessor :password, :password_confirmation
    
    def password=(val)
        logger.debug('val')
        logger.debug(val)
        if val.present?
            logger.debug(BCrypt::Password.create(val))
            self.pass = BCrypt::Password.create(val)
            logger.debug('self.pass')
            logger.debug(self.pass)
        end
        @password = val
    end
    
end
