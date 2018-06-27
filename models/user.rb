class User < ActiveRecord::Base
	validates :username, presence: { message: "username must be given please" }
	validates :password, presence: { message: "password must be given please" }

end
