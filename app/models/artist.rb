class Artist < ActiveRecord::Base

#artist belongs to a user and a genre. 
#a artist can have many albums and are dependent on artist
#validation are set on title and genre so that user has to include these details

	belongs_to :user
	belongs_to :genre
	has_many :albums, dependent: :destroy
	validates :title, presence: true
    validates :title, uniqueness: true
    validates :genre, presence: true

    has_attached_file :artist_img, styles: { artist_index: "150x250>", artist_show: "225x375>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :artist_img, content_type: /\Aimage\/.*\Z/
end
