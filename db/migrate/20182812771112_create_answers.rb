class CreateAnswers < ActiveRecord::Migration[5.0]
	def change
		create_table :answers do |t|
			t.integer :user_id, foreign_key: true
			t.integer :question_id, foreign_key:  true
			t.string :content

			t.timestamps
		end
	end
end