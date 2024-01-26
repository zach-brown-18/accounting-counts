class Client < ApplicationRecord
    has_many :scholarships

    def full_name
        first_name + " " + last_name
    end
end
