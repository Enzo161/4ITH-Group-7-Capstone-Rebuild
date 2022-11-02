class AuditLogsController < ApplicationController
	def index
		#@audit_logs = AuditLog.all.order('id DESC')
		
		@q = AuditLog.ransack(params[:q])
		@audit_logs = @q.result(distinct: true)

		 respond_to do |format|
	      format.html
	      format.pdf do
	        render pdf: "Logs: #{@audit_logs.count}", 
	        template: "audit_logs/index.html.erb",
	        layout: 'pdf',
	        page_size: 'A4',
	        title: 'System Audit Logs',
	        disable_internal_links: true,
	        disable_external_links: true
	     end
  		
  		end
	end


end
 