class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! #user has to be signed in in order to access artists


  def index
    #if the genre is not selected then all the artists will be displayed
    if params[:genre].blank?
      @artists = Artist.all.order("created_at DESC")
    else
      #else when a genre is selected only the artist belonging to that genre is displayed
      @genre_id = Genre.find_by(name: params[:genre]).id
      @artists = Artist.where(:genre_id => @genre_id).order("created_at DESC")
    end
  end


  def show
  end


  def new
    #crete a artist and assign it to the current user and also the genre of the artist
    @artist = current_user.artists.build
    @genre = Genre.all.map{ |g| [g.name, g.id]}
  end

  def edit
    @genre = Genre.all.map{ |g| [g.name, g.id]}
  end


  def create
    @artist = current_user.artists.build(artist_params)
    @artist.genre_id = params[:genre_id]

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @artist.genre_id = params[:genre_id]
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
      format.js { flash[:notice] = 'Artist was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    #all the artist fields are permitted 
    def artist_params
      params.require(:artist).permit(:title, :biography, :genre_id, :artist_img)
    end
end
