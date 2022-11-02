class AuditLogsController < ApplicationController
	def index
		@audit_logs = AuditLog.all.order('id DESC')
	end
end
