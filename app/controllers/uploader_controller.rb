class UploaderController < ApplicationController
	def index
		@return_url = params[:return_url];
	end
end
