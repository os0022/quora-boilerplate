class Vote < ActiveRecord::Base
	belongs_to :users
	belongs_to :questions
	belongs_to :answers
	after_initialize :init

	def init
		self.upvote ||= 0
		self.downvote ||= 0
	end
end