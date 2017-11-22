class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_breadcrumb '商品一覧', :root_path
  
 end
