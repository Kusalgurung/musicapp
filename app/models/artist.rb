class Artist < ActiveRecord::Base
	belongs_to :user
	belongs_to :genre
	has_many :albums, dependent: :destroy
	validates :title, presence: true
    validates :title, uniqueness: true
end
