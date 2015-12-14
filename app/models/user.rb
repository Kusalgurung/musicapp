class User < ActiveRecord::Base

	#User can have many books. 
	has_many :artists, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
