class DeepWell < ApplicationRecord
  belongs_to :client
  has_one_attached :log
  has_one_attached :asbuilt
  has_one_attached :design
end
