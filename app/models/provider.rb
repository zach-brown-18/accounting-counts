class Provider < ApplicationRecord
    def address_full
        "#{street}, #{city}, #{state} #{zip}"
    end
end
