class Post < ApplicationRecord
	belongs_to :user
	has_many :pictures, dependent: :destroy
	has_many :order_posts, dependent: :destroy

	def ordered_by? consumer
		order_posts.where(consumer_id: consumer.id).exists?
	end
end
