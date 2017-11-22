class OrderPostsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@order_post = current_consumer.order_posts.build(post: @post)

		if @order_post.save
			redirect_to post_path(@post), notice: "カートに保存しました"
		else
			redirect_to post_path(@order_post.id), alert: "この商品は注文できません"
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@order_post = current_consumer.order_posts.find_by!(post_id: params[:post_id])
		@order_post.destroy
		redirect_to post_path(@post), notice: "カートから削除しました"
	end
end
