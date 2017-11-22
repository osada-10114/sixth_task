class UsersController < ApplicationController

  def show
  	add_breadcrumb 'マイページ'
    @posts = Post.where(user_id: current_user.id).page(params[:page]).per(50)
  end

end