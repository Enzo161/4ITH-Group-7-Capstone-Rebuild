class Island < ApplicationRecord
	has_many :regions, dependent: :destroy
end
