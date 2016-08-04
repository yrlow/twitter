class CreateTweets < ActiveRecord::Migration
	def change
		create_table :tweets do |t|
			t.references :user, index: true
			t.string :tweet

			t.timestamps null: false
		end
	end
end
