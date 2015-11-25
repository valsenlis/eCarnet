class PrescriptionsController < ApplicationController

  def index
    @questionnaires = Questionnaire.all
    end

    def show
    end
   
   # POST /questionnaires/1/answer.json
  def answer
    # On crée un nouvel objet Prescription à partir des paramètres reçus
  
    @questionnaire = Questionnaire.new(questionnaire_params)

    # On précise que cet object Questionnaire dépend de la Prescription
    @questionnaire.prescription = @prescription

    respond_to do |format|
      if @questionnaire.save
        format.json
      else
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end 

  private

    # On ajoute les paramètres qu'on va envoyer avec le booking
    def questionnaire_params
      params.require(:questionnaire).permit(:prescription_id, :answer1, :answer2, :answer3)
    end
  end
end

