class AddUserIdToArtists < ActiveRecord::Migration
  def up
	add_reference :artists, :user, index: true
	Artist.reset_column_information
	user = User.first
	
	Artist.all.each do |artist|
		artist.user_id = user.id
		artist.save!
  	end
	
	change_column_null :artists, :user_id, false
	add_foreign_key :artists, :users
  end
  
  def down
    remove_foreign_key :artists, :users
    remove_reference :artists, :user, index: true
  end
end
