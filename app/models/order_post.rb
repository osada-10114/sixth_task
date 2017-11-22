class OrderPost < ApplicationRecord
	belongs_to :post
	belongs_to :consumer

	validates :consumer, presence: true
	validates :consumer_id, uniqueness: { scope: :post_id }
	validates :post, presence: true
end
