class Medecin < ActiveRecord::Base
	has_many :prescriptions
end
