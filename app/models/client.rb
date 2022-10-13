class Client < ApplicationRecord
  belongs_to :island
  has_many :deep_wells, dependent: :destroy

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity'
  
end
