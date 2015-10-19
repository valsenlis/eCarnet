class PrescriptionsController < ApplicationController

	def index
    @prescriptions = Prescription.all
  	end

  	def show
  	end
  	
end
