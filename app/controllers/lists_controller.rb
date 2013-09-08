class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @commentable = @list
    @comments = @commentable.comments
    @comment = Comment.new
    @likeable = @list
    @likes = @likeable.likes
    @like = Like.new
    @rateable = @list
    @rates = @rateable.rates
    @rate = Rate.new
    @taglinkable = @list
    @taglinks = @taglinkable.taglinks
    @taglink = Taglink.new
    @tags = Tag.all
    if (@list.list_type ==1 )
      @type="books"
    else 
      if (@list.list_type ==2)
        @type= "videos"
      else
        @type = "articles"
      end
    end
  end

  # GET /lists/new
  def new
    @types =[["书单",1],["视频集",2],["经验贴集",3]]
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
    @types =[["书单",1],["视频集",2],["经验贴集",3]]
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render action: 'show', status: :created, location: @list }
      else
        format.html { render action: 'new' }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:title, :summary, :user_id,:list_type)
    end
end
