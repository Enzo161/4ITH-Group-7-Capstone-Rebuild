class Client < ApplicationRecord
  belongs_to :island
  has_many :deep_wells, dependent: :destroy

  
end
