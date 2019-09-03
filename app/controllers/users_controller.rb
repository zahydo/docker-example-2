class UsersController < ApplicationController
  before_action :authenticate_user!
  #ANTES DE LAS ACCIONES shiw, edit, update y destroy EJECUTA LO QUE ESTÁ EN EL MÉTODO
  #set_user ESTO BUSCA UN USUARIO POR MEDIO DEL id
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    #Verifica si el parametro "buscar_usuario" contiene algo
    if params[:buscar_usuario].present?
      #Esta línea hace lo siguiente:
      # => SELECT * FROM users where nombres like (contenido de buscar_usuario) or apellidos like...
      @users = User.where("nombres LIKE '#{params[:buscar_usuario]}%' or apellidos LIKE '#{params[:buscar_usuario]}%' or apodo LIKE '#{params[:buscar_usuario]}%'").paginate(page: params[:page],per_page:4)
      authorize @users
    else
      #Sino lista todos los usuarios
      @users = User.where("email <> 'admin@alcompas.com'").paginate(page: params[:page],per_page:4)
      authorize @users
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #Usuarios normales no deberían ver la información de otros usuarios
    authorize @user
  end

  # GET /users/new
  def new
    @user = User.new
    authorize @user
    #Usuarios normales no deberían ver la información de otros usuarios
  end

  # GET /users/1/edit
  def edit
    #Usuarios normales no deberían ver la información de otros usuarios
    authorize @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save

        format.html { redirect_to @user, notice: 'EL usuario ha sido creato con éxito.' }
        format.json { render :show, status: :created, location: @user }

        format.html { redirect_to :back, notice: 'EL usuario ha sido creato con éxito.' }
        format.json { render :show, status: :created, location: :back }

      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        redirect_to :new
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    actualizacion_satisfactoria = if necesita_password?(@user, user_params)
                                      @user.update(user_params)
                                  else
                                    @user.update_without_password(user_params)
                                  end
    respond_to do |format|
      if actualizacion_satisfactoria
        format.html { redirect_to @user, notice: 'El usuario ha sido actualizado con éxito.' }
        #format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, notice: 'El usuario no se ha podido actualizar correctamente' }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'El usuario ha sido eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email,:nombres,:apellidos,:apodo,:password,:password_confirmation)
    end

    def necesita_password?(user,params)
      params[:password].present?
    end
end