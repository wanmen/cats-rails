class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :at_least_SCHOLAR_or_redirect, except: [:index, :show]

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
    @Link = Link
    if (@list.links.length != @list.links_array.length)
    	@links_array = []
    	@list.links.each do |link|
    		@links_array.push link.id
    	end
    else
    	@links_array = @list.links_array
    end
#    @links = Link.find(@list.links_array)
  end

  # GET /lists/new
  def new
    @types =[["书单",BOOKLIST],["视频集",VIDEOLIST],["经验贴集",ARTICLELIST],["综合集",MIXLIST]]
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
    @types =[["书单",BOOKLIST],["视频集",VIDEOLIST],["经验贴集",ARTICLELIST],["综合集",MIXLIST]]
    @list= List.find(params[:id])
    if !qualified_to_edit?(@list,current_user,SUPERADMIN)
      redirect_to help_manage_path
    end
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: '新建集合成功' }
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
    @list= List.find(params[:id])
    if (@target[:type] == BOOKLIST && current_user[:role] == SCHOLAR) 

    elsif !qualified_to_edit?(@list,current_user,SUPERADMIN)
      redirect_to help_manage_path
    end
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: '修改集合成功' }
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

    # redirect to different page according to list type
    @redirect = "#"
    @type = @list[:list_type]
    puts @type
    if @type == BOOKLIST
      @redirect = books_path
    elsif @type == VIDEOLIST
      @redirect = videos_path
    elsif @type == ARTICLELIST
      @redirect = articles_path
    else
      @redirect = root_path
    end

    respond_to do |format|
      format.html { redirect_to @redirect, notice: '删除集合成功' }
      format.json { head :no_content }
    end
  end

    def sort
    	list= List.find(params[:id])
    	list.links_array= params[:lkarray]
	list.save    	
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
      params.require(:list).permit(:title, :summary, :list_type).merge(user_id: current_user.id)
    end
    

end
