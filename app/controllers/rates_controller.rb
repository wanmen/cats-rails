class RatesController < ApplicationController
  before_action :set_rate, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @rateable = find_rateable
    @rates = @rateable.rates
  end
  
  def show
  end
  
  def new
    @rate = Rate.new
  end
  
  def create
    @rateable = find_rateable
    @rate = @rateable.rates.new(rate_params)
    respond_to do |format|
      if @rate.save
        format.html { redirect_to @rateable, notice: 'rate was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rateable }
      else
        format.html { render action: 'new' }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @rate = Rate.find(params[:id])
  end
  
  def update
    @rate = Rate.find(params[:id])
    respond_to do |format|
      if @rate.update(rate_params)
        format.html { redirect_to @rate, notice: 'rate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @rate = Rate.find(params[:id])
    @rate.destroy
    flash[:notice] = "Successfully destroyed rate."
    redirect_to rates_url
  end
  
  private

  def find_rateable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_rate
    @rate = Rate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rate_params
    params.require(:rate).permit(:star).merge(user_id: current_user.id)
  end
end
