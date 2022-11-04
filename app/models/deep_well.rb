class DeepWell < ApplicationRecord
  belongs_to :client
  
  has_one_attached :log
  has_one_attached :waterPermit
  has_many_attached :asbuilt 
  has_many_attached :design
  has_many_attached :utviFile
  
end
