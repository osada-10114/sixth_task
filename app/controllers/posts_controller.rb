class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]
  before_action :correct_user, only: [:edit, :update]

  add_breadcrumb '詳細', :post_path, only: [:show, :edit]
  add_breadcrumb '編集', :edit_post_path, only: [:edit]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.page(params[:page]).per(50)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        # 画像のアップロード対応
        if params[:images]
          params[:images].each { |image|
            @post.pictures.create(image: image)
          }
        end

        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        # 画像のアップロード対応
        if params[:images]

          # 前回登録してある画像は全て削除
          Post.find(params[:id]).pictures.each do |image|
            image.destroy
          end

          # 代わりに今回アップする画像に差し替え
          params[:images].each { |image|
            @post.pictures.create(image: image)
          }
        end
        
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :price, :body, :user_id, :pictures, :stock)
    end

    def correct_user
      post = Post.find(params[:id])
      if current_user.id != post.user.id
        redirect_to root_path
      end
    end
    
  end
