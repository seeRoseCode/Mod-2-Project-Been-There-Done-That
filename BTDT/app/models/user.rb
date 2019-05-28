class User < ApplicationRecord
    has_secure_password ######BUG########
    has_many :visits
    has_many :countries, through: :visits
    has_many :posts
    has_many :comments



    def most_points
        User.all.max_by { |user| user.points }
    end

    def avg_visits_per_user
        User.all.average(:visits)
    end

    # def age_range
    # end
end
