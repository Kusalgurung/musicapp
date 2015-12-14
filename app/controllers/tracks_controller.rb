class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :set_album, only: [:new, :create]
  before_action :authenticate_user!
  

  def index
    @tracks = Track.all.order("created_at DESC")
  end


  def show
  end


  def new
    @track = @album.tracks.new
  end


  def edit
  end


  def create
    @track = @album.tracks.new(track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to @track, notice: 'Track was successfully added.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'Track was successfully removed.' }
      format.js { flash[:notice] = 'Track was successfully removed.'}
      format.json { head :no_content }
    end
  end

  private
    
    def set_track
      @track = Track.find(params[:id])
    end

    def track_params
      params.require(:track).permit(:album_id, :title)
    end

    def set_album
      @album = Album.find_by(id: params[:album_id]) ||
      Album.find(track_params[:album_id])
    end
end
