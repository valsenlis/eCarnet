class MedecinsController < ApplicationController
  before_action :set_medecin, only: [:show, :edit, :update, :destroy, :prescribe]

  # On saute une etape de securite si on appel PRESCRIBE en JSON
  skip_before_action :verify_authenticity_token, only: [:prescribe]

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

  # POST /medecins/1/prescribe.json
  def prescribe
    # On crée un nouvel objet Prescription à partir des paramètres reçus
    @prescription = Prescription.new(prescription_params)
    # On précise que cet object Prescription dépend du Médecin et du Patient
    @prescription.medecin = @medecin
    @prescription.patient = @patient

    respond_to do |format|
      if @prescription.save
        format.json
      else
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
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

    # On ajoute les paramètres qu'on va envoyer avec le booking
    def prescription_params
      params.require(:prescription).permit(:texte, :duree)
    end
end
