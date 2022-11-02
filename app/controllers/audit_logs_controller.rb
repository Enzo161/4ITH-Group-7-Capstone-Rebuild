class AuditLogsController < ApplicationController
	def index
		#@audit_logs = AuditLog.all.order('id DESC')
		
		@q = AuditLog.ransack(params[:q])
		@audit_logs = @q.result(distinct: true)
	end
end
 