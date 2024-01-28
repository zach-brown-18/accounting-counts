class Client < ApplicationRecord
    has_many :scholarships

    def full_name
        first_name + " " + last_name
    end

    def address_full
        "#{street}, #{city}, #{state} #{zip}"
    end
end
