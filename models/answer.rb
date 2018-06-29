class Answer < ActiveRecord::Base
	validates :content, presence: true
	belongs_to :users
	belongs_to :questions
end