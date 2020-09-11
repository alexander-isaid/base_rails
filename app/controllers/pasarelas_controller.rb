class PasarelasController < ApplicationController
  load_and_authorize_resource
  check_authorization
  before_action :set_pasarela, only: [:show, :edit, :update, :destroy]

  # GET /pasarelas
  # GET /pasarelas.json
  def index
    @pasarelas = Pasarela.activas.paginate(page: params[:page], per_page: 5)
    if params[:search].present? 
      @search_terms = params[:search]
      @pasarelas = @pasarelas.search_by(@search_terms)
    end
  end

  # GET /pasarelas/1
  # GET /pasarelas/1.json
  def show
  end

  # GET /pasarelas/new
  def new
    @pasarela = Pasarela.new
  end

  # GET /pasarelas/1/edit
  def edit
  end

  # POST /pasarelas
  # POST /pasarelas.json
  def create
    @pasarela = Pasarela.new(pasarela_params)
    @pasarela.estado = true
    @pasarela.eliminado = false
    respond_to do |format|
      if @pasarela.save
        format.html { redirect_to @pasarela, notice: 'Pasarela was successfully created.' }
        format.json { render :show, status: :created, location: @pasarela }
      else
        format.html { render :new }
        format.json { render json: @pasarela.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pasarelas/1
  # PATCH/PUT /pasarelas/1.json
  def update
    respond_to do |format|
      if @pasarela.update(pasarela_params)
        format.html { redirect_to @pasarela, notice: 'Pasarela was successfully updated.' }
        format.json { render :show, status: :ok, location: @pasarela }
      else
        format.html { render :edit }
        format.json { render json: @pasarela.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pasarelas/1
  # DELETE /pasarelas/1.json
  def destroy
    @pasarela.destroy
    respond_to do |format|
      format.html { redirect_to pasarelas_url, notice: 'Pasarela was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pasarela
      @pasarela = Pasarela.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pasarela_params
      params.require(:pasarela).permit(:nombre, :url_servicio, :estado, :eliminado)
    end
end
