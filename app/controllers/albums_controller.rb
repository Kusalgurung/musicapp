class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :set_artist, only: [:new, :create]
  before_action :authenticate_user!

  #user needs to be authenticated in order to view the albums, artists and tracks
  def index
    @albums = Album.all.order("created_at DESC")
    #displays the albums in descending order
  end


  def show
  end

  def new
    @album = @artist.albums.new
  end

  def edit
  end

  def create
    @album = @artist.albums.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.js { flash[:notice] = 'Album was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private

    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:artist_id, :title, :album_img)
    end

    def set_artist
      @artist = Artist.find_by(id: params[:artist_id]) ||
      Artist.find(album_params[:artist_id])
    end
end
