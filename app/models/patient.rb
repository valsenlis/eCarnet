class Patient < ActiveRecord::Base
	has_many :prescriptions
	belongs_to :medecin
end
