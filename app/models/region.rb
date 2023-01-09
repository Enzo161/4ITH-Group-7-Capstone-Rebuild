class Region < ApplicationRecord
    belongs_to :island
    has_many :clients, dependent: :destroy
end