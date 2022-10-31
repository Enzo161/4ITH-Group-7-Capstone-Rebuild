class DeepWell < ApplicationRecord
  belongs_to :client
  
  has_one_attached :log
  has_many_attached :asbuilt 
  has_many_attached :design


  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity'
  
end
