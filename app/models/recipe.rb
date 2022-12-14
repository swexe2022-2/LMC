class Recipe < ApplicationRecord

    validates :fname,:ingredients,:process, presence: true
    
    belongs_to :user


    
    def self.search(keyword)

        where(["ingredients like? OR fname like? OR tag like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])

    end


end
