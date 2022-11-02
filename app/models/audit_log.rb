class AuditLog < ApplicationRecord
	validates_presence_of :event
	validates_presence_of :modifier
	validates_presence_of :table_name
	validates_presence_of :object_name

end