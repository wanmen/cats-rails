class SearchController < ApplicationController
	def index
		@params = params
		if(params[:title])
			@title = params[:title]
			if (params[:type])
				case params[:type] 
				when 'book' 
				  @books = Book.find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
				when 'video' 
				  @videos =  Video.find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
			    when 'article' 
				  @articles =  Article.find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
				else # the else clause is optional  
				end 
			else 
				@books = Book.find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
				@videos =  Video.find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
			    @articles =  Article.find(:all, :conditions => ["title LIKE ?", "%"+params[:title]+"%"])
			end
		end
	end
end
