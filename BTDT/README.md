# README
Been There Done That ReadMe

Welcome to our Rails application, Been There Done That! This web application enables users to create an account, allows the user to login/logout, and track their visits to countries all of the world. Users will also be able to receive points as they travel to new countries and view a leaderboard for several different categories.

User Stories
1. User should be able to create a username and password
2. User can select countries where they have visited
3. User can accumulate points through visits to more countries and can receive bonus points for visit tiers
4. User can create posts about their visits
5. User can create comments on other users’ visits and their own visits


Site Map
-  Home
    -  Users
        -  New (Create New Account)
	-  Index (All Users Page)	
        -  Show (User Profile)
        -  Edit & Update (Profile Picture, Age, and Country of Origin)
        -  Delete (Delete Profile)

    -  Visits
	-  New (Create New Visits)	

    -  Countries
	-  Index (All Countries Page)	
        -  Show (Country Details Page)

    -  Posts
        -  New (Create New Post)
	-  Index (All Posts Page)	
        -  Show (Post Details Page with Associated Comments)
        -  Edit & Update (Profile Picture, Age, and Country of Origin)
        -  Delete (Delete Profile)

    -  Comments
        -  New (Create New Comment)
        -  Edit & Update (Edit Comment)
        -  Delete (Delete Comment)


Tables and Schema
Users 
    t.string "name"
    t.integer "age"
    t.string "country_of_origin"
    t.string "profile_pic"
    t.integer "points"
    t.string "password_digest"

Countries
    t.string "name"
    t.string "language"
    t.string "flag_emoji"

Visits 
    t.integer "country_id"
    t.integer "user_id"

Posts
    t.string "title"
    t.string "content"
    t.integer "user_id"

Comments
    t.string "text"
    t.integer "post_id"
    t.integer "user_id"


Relationships
User
    has_secure_password 
    has_many :visits, dependent: :destroy
    has_many :countries, through: :visits
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    validates :name, presence: true 
    validates :password, presence: true

Country
  has_many :visits
  has_many :users, through: :visits

Visit
  belongs_to :country
  belongs_to :user

Post 
    has_many :comments, dependent: :destroy
    belongs_to :user

Comment
    belongs_to :user
    belongs_to :post
