class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  load_and_authorize_resource

  # GET /books
  # GET /books.json
  def index
    @newest = Book.newest6
    @popular = Book.top10
    @popularTags = Tag.top20
    @best = Book.best6
    @popularBooklist = List.top10Booklist
    @bestBooklist = List.best6Booklist
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @commentable = @book
    @comments = @commentable.comments
    @comment = Comment.new
    @likeable = @book
    @likes = @likeable.likes
    @like = Like.new
    @rateable = @book
    @rates = @rateable.rates
    @rate = Rate.new
    @taglinkable = @book
    @taglinks = @taglinkable.taglinks
    @taglink = Taglink.new
    @linkable = @book
    @links = @linkable.links
    @link = Link.new
    @best = Book.best6
    if (current_user)
      @lists = List.where("user_id = ? AND (list_type = ? OR list_type = ?)", current_user[:id], BOOKLIST, MIXLIST)
    else
      @lists = []
    end
    if @lists.length>0
      @list = @lists.take!
    else
      @list = List.new
    end
    @tags = Tag.all
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit

  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.where(title: book_params[:title], author: book_params[:author]).take

    respond_to do |format|
      if @book != nil
        format.html { redirect_to @book, notice: '此书已经存在' }
        format.json { render action: 'show', status: :failed, location: @book }
      else
        @book = Book.new(book_params)
        @book[:user_id] = current_user.id
        if @book.save
          format.html { redirect_to @book, notice: '您已成功添加新书' }
          format.json { render action: 'show', status: :created, location: @book }
        else
          format.html { render action: 'new' }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end 
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: '修改图书信息成功' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: '成功删除图书' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :dbid, :cover, :summary, :isbn, :author, :publisher, :url, :translator)
    end
end
