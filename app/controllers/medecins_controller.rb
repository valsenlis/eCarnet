class MedecinsController < ApplicationController
  before_action :set_medecin, only: [:show, :edit, :update, :destroy]

  # GET /medecins
  # GET /medecins.json
  def index
    @medecins = Medecin.all
  end

  # GET /medecins/1
  # GET /medecins/1.json
  def show
  end

  # GET /medecins/new
  def new
    @medecin = Medecin.new
  end

  # GET /medecins/1/edit
  def edit
  end

  # POST /medecins
  # POST /medecins.json
  def create
    @medecin = Medecin.new(medecin_params)

    respond_to do |format|
      if @medecin.save
        format.html { redirect_to @medecin, notice: 'Medecin was successfully created.' }
        format.json { render :show, status: :created, location: @medecin }
      else
        format.html { render :new }
        format.json { render json: @medecin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medecins/1
  # PATCH/PUT /medecins/1.json
  def update
    respond_to do |format|
      if @medecin.update(medecin_params)
        format.html { redirect_to @medecin, notice: 'Medecin was successfully updated.' }
        format.json { render :show, status: :ok, location: @medecin }
      else
        format.html { render :edit }
        format.json { render json: @medecin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medecins/1
  # DELETE /medecins/1.json
  def destroy
    @medecin.destroy
    respond_to do |format|
      format.html { redirect_to medecins_url, notice: 'Medecin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medecin
      @medecin = Medecin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medecin_params
      params.require(:medecin).permit(:nom, :lieu, :specialite)
    end
end
