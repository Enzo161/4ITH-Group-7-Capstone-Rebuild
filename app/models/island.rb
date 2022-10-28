class Island < ApplicationRecord
	has_many :clients, dependent: :destroy

	include PublicActivity::Model
	tracked owner: Proc.new{ |controller, model| controller.current_user }
	
	has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity'
end
