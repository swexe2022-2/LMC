class Recipe < ApplicationRecord
    validates :fname,:ingredients,:process, presence: true
    
    belongs_to :user
    
end
