class TaglinksController < ApplicationController
  before_action :set_taglink, only: [:show, :edit, :update, :destroy]

  # GET /taglinks
  # GET /taglinks.json
  def index
    @taglinks = Taglink.all
  end

  # GET /taglinks/1
  # GET /taglinks/1.json
  def show
  end

  # GET /taglinks/new
  def new
    @taglink = Taglink.new
  end

  # GET /taglinks/1/edit
  def edit
  end

  # POST /taglinks
  # POST /taglinks.json
  def create
    @taglink = Taglink.new(taglink_params)

    respond_to do |format|
      if @taglink.save
        format.html { redirect_to @taglink, notice: 'taglink was successfully created.' }
        format.json { render action: 'show', status: :created, location: @taglink }
      else
        format.html { render action: 'new' }
        format.json { render json: @taglink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taglinks/1
  # PATCH/PUT /taglinks/1.json
  def update
    respond_to do |format|
      if @taglink.update(taglink_params)
        format.html { redirect_to @taglink, notice: 'taglink was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @taglink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taglinks/1
  # DELETE /taglinks/1.json
  def destroy
    @taglink.destroy
    respond_to do |format|
      format.html { redirect_to taglinks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taglink
      @taglink = Taglink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taglink_params
      params.require(:taglink).permit(:topic_id, :taglinkable)
    end
end
