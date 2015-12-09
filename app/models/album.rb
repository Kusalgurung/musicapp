class Album < ActiveRecord::Base
  belongs_to :artist
  validates :title, :artist, presence: true
end
