class SongsController < ApplicationController

  # GET /songs
  # GET /songs.json
  def index
    @song = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])
    render :show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
    render :edit
  end

  # POST /songs
  # POST /songs.json
  def create
      @song = Song.new(song_params)
      # Get user
      @user = current_user
      # Get song/s
      song_lyricsimage = song_params[:image]
      original_filename = "something.png"
      # Create temporary file

      @file = PullTempfile.pull_tempfile(url: song_lyricsimage, original_filename: original_filename)
      # Create empty array for lyrics text
      @lyrics_array = [];
      # Hit the cloud vision API with wrapper
      @song_tags = GoogleCloudVision::Classifier.new(ENV["API_KEY"],
      [{ image: @file, detection: 'TEXT_DETECTION', max_results: 10 }]).response["responses"][0]["textAnnotations"].each do |tag|
        @lyrics_array.push(tag["lyrics"])
      end

      p @lyrics_array

      if @song.save
        @lyrics_array.each do |value|
          @tag = Tag.new({song_id: @song.id, lyrics: value})
        end
      end
    # end

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    # redirect_to '/'
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def tagged
    if params[:tag].present?
      @songs = Song.tagged_with(params[:tag])
    else
      @songs = Song.all
    end
  end


  def tag_cloud
    @tags = Song.tag_counts_on(:tags)
  end
   # Use callbacks to share common setup or constraints between actions.
  # def set_song
      # @song = Song.find(params[:id])
  # end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :lyrics, :origin, :tag_list, :image)
    end

end
