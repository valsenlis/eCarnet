class Patient < ActiveRecord::Base
	has_many :prescriptions
end
