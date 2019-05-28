class User < ApplicationRecord
    has_secure_password
    has_many :visits
    has_many :countries, through :visits
    has_many :posts
    has_many :comments


    def most_points
        @@users.max_by { |user| user.points }
    end

    def self.avg_visits_per_user
        all.average(:visits)
    end

    def age_range
    end
end
