class Client < ApplicationRecord
  belongs_to :region

  has_many :deep_wells, dependent: :destroy

end