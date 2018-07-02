class User < ActiveRecord::Base
	has_secure_password

	validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/, message: "unvalid email" }
	has_many :questions, foreign_key: :user_id
	has_many :answers, foreign_key:  :user_id
	has_many :votes, foreign_key: :user_id
end
