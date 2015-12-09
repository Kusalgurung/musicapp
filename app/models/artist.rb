class Artist < ActiveRecord::Base
	has_many :albums, dependent: :destroy
	validates :title, presence: true
    validates :title, uniqueness: true
end
