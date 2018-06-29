class Question < ActiveRecord::Base
	belongs_to :user

	has_many :answers, foreign_key:  :question_id
end