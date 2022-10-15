class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include PublicActivity::Model
  tracked only: [:create, :destroy], owner: Proc.new{ |controller, model| controller.current_user }

  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity'

end