class CreateTable < ActiveRecord::Migration[5.0]
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :users do |t|
   	  t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end