class FrelationshipsController < ApplicationController
    
    def create
      @micropost = Micropost.find(params[:fmicropost_id])
      current_user.favorite(@micropost)
    end
    
    def destroy
      @micropost = current_user.frelationships.find(params[:id]).fuser
      current_user.unfavorite(@micropost)
    end
    
end
