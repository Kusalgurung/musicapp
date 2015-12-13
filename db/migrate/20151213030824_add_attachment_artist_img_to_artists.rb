class AddAttachmentArtistImgToArtists < ActiveRecord::Migration
  def self.up
    change_table :artists do |t|
      t.attachment :artist_img
    end
  end

  def self.down
    remove_attachment :artists, :artist_img
  end
end
