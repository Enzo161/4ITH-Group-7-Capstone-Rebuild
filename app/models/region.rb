class Region < ApplicationRecord
    belongs_to :region
    has_many :deep_wells
end