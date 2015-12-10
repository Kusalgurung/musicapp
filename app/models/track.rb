class Track < ActiveRecord::Base
  belongs_to :album
  validates :title, :album, presence: true
end
