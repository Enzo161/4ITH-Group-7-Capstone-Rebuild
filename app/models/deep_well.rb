class DeepWell < ApplicationRecord
  belongs_to :client
  
  has_one_attached :log
  has_many_attached :asbuilt 
  has_many_attached :design
  
end
