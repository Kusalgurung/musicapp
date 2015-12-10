class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :tracks, dependent: :destroy
  validates :title, :artist, presence: true
  validates :title, presence: true
  validates :title, uniqueness: true
end
