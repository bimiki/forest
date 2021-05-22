class RatingsController < ApplicationController
  before_filter :set_video

  def create
    @rating = @video.ratings.new :value => params[:value]
    if @rating.save
      redirect_to video_ratings_path(@video), :notice => "Rating successful."
    else
      redirect_to video_ratings_path(@video), :notice => "Something went wrong."
    end
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.update_attribute :value, params[:value]
  end

  private
    def set_video
      @video = Video.find(parms[:video_id])
    end
end
# this is the one i tried to write myself kinda but couldnt get to work so maybe use letsrate ?
