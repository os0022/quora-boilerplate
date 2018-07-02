class Answer < ActiveRecord::Base
	validates :content, presence: true
	belongs_to :users
	belongs_to :questions
	has_many :votes, foreign_key: :answer_id
end