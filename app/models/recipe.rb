class Recipe < ApplicationRecord
    def self.search(keyword)
        where(["ingredients like? OR fname like?", "%#{keyword}%", "%#{keyword}%"])
    end

end
