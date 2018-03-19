class Article < ApplicationRecord
	validates :title, presence: true, uniqueness: true
	validates :down, presence: true , length: {maximum: 200}
	validates :body, presence: true
	has_many :comments , dependent: :delete_all
end
