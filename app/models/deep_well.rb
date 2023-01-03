class DeepWell < ApplicationRecord
  include Discard::Model
  
  belongs_to :client
  
  has_one_attached :log
  has_one_attached :waterPermit
  has_many_attached :asbuilt 
  has_many_attached :design
  has_many_attached :utviFile
  validates_presence_of :deep_well_name
end
