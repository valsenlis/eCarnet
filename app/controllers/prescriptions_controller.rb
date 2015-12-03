class PrescriptionsController < ApplicationController
	before_action :set_prescription, only: [:show]

	def index
      @prescriptions = Prescription.all
  	end

  	# GET prescriptions/:id
  	def show
  	end
  	

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescription
      @prescription = Prescription.find(params[:id])
    end
end
