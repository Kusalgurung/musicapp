class Artist < ActiveRecord::Base
	belongs_to :user
	belongs_to :genre
	has_many :albums, dependent: :destroy
	validates :title, presence: true
    validates :title, uniqueness: true

    has_attached_file :artist_img, styles: { artist_index: "250x350>", artist_show: "325x4750>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :artist_img, content_type: /\Aimage\/.*\Z/
end
