class Album < ActiveRecord::Base

  belongs_to :artist
  has_many :tracks, dependent: :destroy
  validates :title, :artist, presence: true
  validates :title, presence: true
  validates :title, uniqueness: true

  #enables users to attach a image file to albums 

  has_attached_file :album_img, styles: { album_index: "150x250>", album_show: "225x375>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :album_img, content_type: /\Aimage\/.*\Z/
end
