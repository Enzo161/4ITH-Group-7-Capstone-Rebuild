class Island < ApplicationRecord
	has_many :clients, dependent: :destroy
end
