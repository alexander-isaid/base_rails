class UsuariosController < ApplicationController
  load_and_authorize_resource :empresa
  check_authorization
  before_action :authenticate_user!
  before_action :set_empresa
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
      @usuarios = @empresa.usuarios.activos.paginate(page: params[:page], per_page: 5)
      if params[:search].present? 
        @search_terms = params[:search]
        @usuarios = @usuarios.search_by(@search_terms)
      end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
    @usuario.empresa_id = @empresa.id
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)
    @usuario.empresa_id = @empresa.id
    @usuario.estado = true
    @usuario.eliminado = false
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to empresa_usuario_path(@usuario.empresa_id,@usuario.id), notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        @usuario.modificar_role(params[:usuario][:roles])
        format.html { redirect_to empresa_usuarios_path(@usuario.empresa_id), notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.update(eliminado: true)
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    def set_empresa
      @empresa = Empresa.find(params[:empresa_id])
    end

    # Only allow a list of trusted parameters through.
    def usuario_params
      params.require(:usuario).permit(:email, :name, :password, :password_confirmation)
    end
end
