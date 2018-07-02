class CreateVotes < ActiveRecord::Migration[5.0]
	def change
		create_table :votes do |t|
			t.integer :user_id, foreign_key: true
			t.integer :question_id, foreign_key:  true
			t.integer :answer_id, foreign_key:  true
			t.integer :upvote
			t.integer :downvote

			t.timestamps
		end
	end
end