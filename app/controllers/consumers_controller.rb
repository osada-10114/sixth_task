class ConsumersController < ApplicationController

  def show
  	add_breadcrumb 'カート一覧'
  	@consumer = Consumer.find(params[:id])
  	@posts = @consumer.order_posts.map { |f| f.post }
  end

  def order_posts
  	@consumer = Consumer.find(params[:id])
  end

end
