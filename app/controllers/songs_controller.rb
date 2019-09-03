class SongsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :index, :new]
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def resultados

    if params[:buscar_cancion].present?
      if params[:criterio] == "titulo"
        @songs = Song.where("titulo LIKE '%#{params[:buscar_cancion].downcase}%'").order(:titulo).paginate(page: params[:page],per_page:4) 
        @count = Song.where("titulo LIKE '%#{params[:buscar_cancion].downcase}%'").order(:titulo).count
      end
      if params[:criterio] == "autor"
        @songs = Song.where("autor LIKE '%#{params[:buscar_cancion].downcase}%'").order(:titulo).paginate(page: params[:page],per_page:4) 
        @count = Song.where("autor LIKE '%#{params[:buscar_cancion].downcase}%'").order(:titulo).count
      end
      if params[:criterio] != "autor" and params[:criterio] != "titulo"
        @songs = Song.where("titulo LIKE '%#{params[:buscar_cancion].downcase}%' or autor LIKE '%#{params[:buscar_cancion].downcase}%'").order(:titulo).paginate(page: params[:page],per_page:4)
        @count = Song.where("titulo LIKE '%#{params[:buscar_cancion].downcase}%' or autor LIKE '%#{params[:buscar_cancion].downcase}%'").order(:titulo).count
      end
    else
      @songs = Song.all.order(:titulo).paginate(page: params[:page],per_page:4)
      @count = Song.count
    end  
  end
  # GET /songs
  # GET /songs.json
  def index
    
    if params[:buscar_cancion].present?
      @songs = Song.where("user_id = #{current_user.id} AND (titulo LIKE '%#{params[:buscar_cancion]}%' or autor LIKE '%#{params[:buscar_cancion].downcase}%')").order(:titulo).paginate(page: params[:page],per_page:4)
      @count = Song.where("user_id = #{current_user.id} AND (titulo LIKE '%#{params[:buscar_cancion]}%' or autor LIKE '%#{params[:buscar_cancion].downcase}%')").count
    else
      @songs = Song.where("user_id = #{current_user.id}").order(:titulo).paginate(page: params[:page],per_page:4)
      @count = Song.where("user_id = #{current_user.id}").count
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    #Cada vez que se muestre una canción se actualiza el contador
    @song.update_contador_visitas
    @comment = Comment.new
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = current_user.songs.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'La canción fue creada exitosamente' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'La canción fue actualizada exitosamente' }
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
      format.html { redirect_to songs_url, notice: 'La canción fue eliminada exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:titulo,:autor,:album,:anio_creacion,:letra,:genre_id,:tuning_id,:url_video,:user_id)
    end
end