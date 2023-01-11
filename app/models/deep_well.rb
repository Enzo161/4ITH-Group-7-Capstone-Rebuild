class DeepWell < ApplicationRecord
  include Discard::Model
  
  belongs_to :client
  
  has_one_attached :log
  has_one_attached :waterPermit
  has_many_attached :asbuilt 
  has_many_attached :design
  has_many_attached :utviFile

  validates_presence_of :deep_well_name

  validates :log, content_type: { in: ['application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'text/csv', 'application/pdf'], message: 'Lithologic Logs should be in Excel, CSV or PDF format' }
  validates :waterPermit, content_type: { in: ['image/png', 'image/jpg', 'image/jpeg', 'application/pdf'], message: 'Water Permit files should be in PNG, JPG, JPEG, or PDF format' }
  validates :asbuilt, content_type: { in: ['application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'text/csv', 'application/pdf'], message: 'As-Built Design files should be in Excel, CSV or PDF format' }
  validates :design, content_type: { in: ['application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'text/csv', 'application/pdf'], message: 'Design Proposal files should be in Excel, CSV or PDF format' }
  validates :utviFile, content_type: { in: ['application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'text/csv', 'application/pdf'], message: 'UTVI Files should be in Excel, CSV or PDF format' }

end
