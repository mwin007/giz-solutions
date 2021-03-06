# frozen_string_literal: true

require 'sendgrid-ruby'

module SendGridMailer
  include SendGrid

  def get_content(template, assigns = {})
    Content.new(
      type: 'text/html',
      value: ApplicationController.render(
        template: template,
        layout: nil,
        assigns: assigns
      )
    )
  end

  def sendgrid_mail(subject, to, content)
    mail = Mail.new(from_email, subject, to, content)
    mail.asm = ASM.new(group_id: 5827)
    # puts request_body = mail.to_json
    response = sendgrid_client.mail._('send').post(request_body: mail.to_json)
    # puts response.status_code
    # puts response.body
    # puts response.headers
  end

  def sendgrid_client
    @sg ||= SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY']).client
  end

  def from_email
    @from ||= Email.new(email: "GIZ solutions <#{GizSolutions.config.support_email}>")
  end
end
