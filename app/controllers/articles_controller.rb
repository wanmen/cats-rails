class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :at_least_ADMIN_or_redirect, except: [:index, :show]  
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    @best6 = Article.best6
    @newest10 = Article.newest10
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @commentable = @article
    @comments = @commentable.comments
    @comment = Comment.new
    @likeable = @article
    @likes = @likeable.likes
    @like = Like.new
    @rateable = @article
    @rates = @rateable.rates
    @rate = Rate.new
    @taglinkable = @article
    @taglinks = @taglinkable.taglinks
    @taglink = Taglink.new
    @linkable = @article
    @links = @linkable.links
    @link = Link.new
    @best = Article.best6
    if (current_user)
      @lists = List.where("user_id = ? AND list_type = ?", current_user[:id], 3)
    else
      @lists = []
    end
    @tags = Tag.all
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    if !qualified_to_edit?(Article.find(params[:id]),current_user,SUPERADMIN)
      redirect_to help_manage_path
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: '您已成功添加新的经验贴' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new', notice: '添加经验贴失败' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: '您已成功修改经验贴' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: '成功删除经验贴' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :summary, :content, :url, :author).merge(user_id: current_user.id)
    end
end
