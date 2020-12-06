class Tag < ApplicationRecord
	belongs_to :user
	validates :title, presence: true, length: {minimum: 2, maximum: 10}
	validates :body, presence: true, length: {maximum: 30}
end
