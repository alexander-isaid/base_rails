class EmpresaPasarelasController < ApplicationController
  load_and_authorize_resource :empresa
  check_authorization
  before_action :authenticate_user!
  before_action :set_empresa
  before_action :set_empresa_pasarela, only: [:show, :edit, :update, :destroy]

  # GET /empresa_pasarelas
  # GET /empresa_pasarelas.json
  def index
    @empresa_pasarelas = @empresa.empresa_pasarelas.activas
  end

  # GET /empresa_pasarelas/1
  # GET /empresa_pasarelas/1.json
  def show
  end

  # GET /empresa_pasarelas/new
  def new
    @empresa_pasarela = EmpresaPasarela.new
  end

  # GET /empresa_pasarelas/1/edit
  def edit
  end

  # POST /empresa_pasarelas
  # POST /empresa_pasarelas.json
  def create
    @empresa_pasarela = EmpresaPasarela.new(empresa_pasarela_params)
    @empresa_pasarela.empresa_id = @empresa.id
    @empresa_pasarela.estado = true
    respond_to do |format|
      if @empresa_pasarela.save
        format.html { redirect_to empresa_empresa_pasarela_path(@empresa,@empresa_pasarela), notice: 'Empresa pasarela was successfully created.' }
        format.json { render :show, status: :created, location: @empresa_pasarela }
      else
        format.html { render :new }
        format.json { render json: @empresa_pasarela.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empresa_pasarelas/1
  # PATCH/PUT /empresa_pasarelas/1.json
  def update
    respond_to do |format|
      if @empresa_pasarela.update(empresa_pasarela_params)
        format.html { redirect_to empresa_empresa_pasarela_path(@empresa,@empresa_pasarela), notice: 'Empresa pasarela was successfully updated.' }
        format.json { render :show, status: :ok, location: @empresa_pasarela }
      else
        format.html { render :edit }
        format.json { render json: @empresa_pasarela.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresa_pasarelas/1
  # DELETE /empresa_pasarelas/1.json
  def destroy
    @empresa_pasarela.destroy
    respond_to do |format|
      format.html { redirect_to empresa_pasarelas_path(@empresa), notice: 'Empresa pasarela was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa_pasarela
      @empresa_pasarela = EmpresaPasarela.find(params[:id])
    end

    def set_empresa
      @empresa = Empresa.find(params[:empresa_id])
    end

    # Only allow a list of trusted parameters through.
    def empresa_pasarela_params
      params.require(:empresa_pasarela).permit(:empresa_id, :pasarela_id, :estado, :username, :llave, :terminal_id, :merchant)
    end
end
