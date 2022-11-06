#WickedPdf.config = {
  #exe_path: 'C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe', 
  #exe_path: '#{Rails.root}/bin/wkhtmltopdf',
  #enable_local_file_access: true

  if Rails.env.staging? || Rails.env.production?
  WickedPdf.config = {:exe_path => Rails.root.join('bin', 'wkhtmltopdf-64bit').to_s}
  else
  WickedPdf.config = { :exe_path => 'C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf.exe'}
end
    

#}
