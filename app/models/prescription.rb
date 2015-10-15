class Prescription < ActiveRecord::Base
  belongs_to :medecin
  belongs_to :patient
end
