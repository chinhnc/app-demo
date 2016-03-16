class ApplicationMailer < ActionMailer::Base
  default from: "admin@app-demo.com"
  layout 'mailer'
end
